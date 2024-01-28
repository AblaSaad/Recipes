import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:recipes/models/recipe_model.dart';
import 'package:recipes/pages/recipes_specifies_page.dart';
import '../provider/recipes_provider.dart';

class RecipeWidget extends StatefulWidget {
  final Recipe? recipe;

  const RecipeWidget({required this.recipe, super.key});

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => RecipeSpecifyPage(
                            recipe: widget.recipe!,
                          )));
            },
            child: Container(
              width: 160,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffeeeeee),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Transform.translate(
                      offset: const Offset(10, 0),
                      child: Image.network(
                        alignment: Alignment.topRight,
                        widget.recipe?.imageUrl ?? "",
                        fit: BoxFit.fitHeight,
                        width: 50,
                        height: 86,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.recipe?.type ?? 'No Type Found',
                      style: const TextStyle(
                        color: Color(0xff2097b3),
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.recipe?.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      updateOnDrag: false,
                      unratedColor: Colors.grey,
                      itemCount: 5,
                      itemSize: 15,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Color(0xffF55A00),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      widget.recipe?.calories.toString() ?? '',
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 20,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.recipe?.total_time.toString() ?? "",
                          style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.room_service_outlined,
                          size: 20,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${widget.recipe?.servings ?? 0}",
                          style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
                onTap: () {
                  Provider.of<RecipesProvider>(context, listen: false)
                      .addFavourietRecipeToUser(
                          widget.recipe!.docId!,
                          !(widget.recipe?.favourites_user_ids?.contains(
                                  FirebaseAuth.instance.currentUser?.uid) ??
                              false));
                },
                child: (widget.recipe?.favourites_user_ids?.contains(
                            FirebaseAuth.instance.currentUser?.uid) ??
                        false
                    ? const Icon(
                        Icons.favorite,
                        size: 30,
                        color: Color(0xffF55A00),
                      )
                    : const Icon(
                        Icons.favorite_rounded,
                        size: 30,
                        color: Colors.grey,
                      ))),
          ),
        ],
      ),
    );
  }
}
