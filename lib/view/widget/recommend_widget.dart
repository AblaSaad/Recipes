import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:recipes/models/recipe_model.dart';
import 'package:recipes/view/pages/recipes_specifies_page.dart';
import 'package:recipes/provider/recipes_provider.dart';

class RecommendWidget extends StatefulWidget {
  final Recipe? recipe;
  const RecommendWidget({required this.recipe, super.key});

  @override
  State<RecommendWidget> createState() => _RecommendWidgetState();
}

class _RecommendWidgetState extends State<RecommendWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => RecipeSpecifyPage(
                        recipe: widget.recipe!,
                      )));
        },
        child: Card(
          elevation: 2,
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              color: const Color(0xffeeeeee),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          alignment: Alignment.topRight,
                          widget.recipe?.imageUrl ?? "",
                          fit: BoxFit.fill,
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.recipe?.type ?? 'No Type Found',
                          style: const TextStyle(
                            color: Color(0xff2097b3),
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
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
                          height: 3,
                        ),
                        Text(
                          widget.recipe?.calories.toString() ?? '',
                          style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: InkWell(
                              onTap: () {
                                Provider.of<RecipesProvider>(context,
                                        listen: false)
                                    .addFavourietRecipeToUser(
                                        widget.recipe!.docId!,
                                        !(widget.recipe?.favourites_user_ids
                                                ?.contains(FirebaseAuth.instance
                                                    .currentUser?.uid) ??
                                            false));
                              },
                              child: (widget.recipe?.favourites_user_ids
                                          ?.contains(FirebaseAuth
                                              .instance.currentUser?.uid) ??
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
                  ]),
            ),
          ),
        ),
      )
    ]);
  }
}
