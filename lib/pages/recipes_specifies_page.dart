import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:recipes/models/ingredient_model.dart';
import 'package:recipes/models/recipe_model.dart';
import 'package:recipes/provider/recipes_provider.dart';

class RecipeSpecifyPage extends StatefulWidget {
  final Recipe recipe;
  const RecipeSpecifyPage({required this.recipe, super.key});

  @override
  State<RecipeSpecifyPage> createState() => _RecipeSpecifyPageState();
}

class _RecipeSpecifyPageState extends State<RecipeSpecifyPage> {
  @override
  void initState() {
    Provider.of<RecipesProvider>(context, listen: false)
        .addRecentlyViewedRecipeToUser(widget.recipe.docId!);

    super.initState();
  }

  bool get isInList => (widget.recipe.favourites_user_ids
          ?.contains(FirebaseAuth.instance.currentUser?.uid) ??
      false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('specfies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.recipe.type ?? 'No Type Found',
                    style: const TextStyle(
                      color: Color(0xff2097b3),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Provider.of<RecipesProvider>(context, listen: false)
                          .addFavourietRecipeToUser(
                              widget.recipe.docId!, !isInList);

                      if (isInList) {
                        widget.recipe.favourites_user_ids
                            ?.remove(FirebaseAuth.instance.currentUser?.uid);
                      } else {
                        widget.recipe.favourites_user_ids
                            ?.add(FirebaseAuth.instance.currentUser!.uid);
                      }

                      setState(() {});
                    },
                    child: isInList
                        ? const Icon(
                            Icons.favorite,
                            size: 30,
                            color: Color(0xffF55A00),
                          )
                        : const Icon(
                            Icons.favorite,
                            size: 30,
                            color: Colors.grey,
                          ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.recipe.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
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
                      widget.recipe.calories.toString(),
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Column(
                      children: [
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
                              widget.recipe.total_time.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.room_service_outlined,
                              size: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${widget.recipe.servings ?? 0}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Image.network(
                    widget.recipe.imageUrl ?? "",
                    width: 120,
                    height: 70,
                    fit: BoxFit.fitWidth,
                  ),
                ]),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 2,
              decoration: BoxDecoration(
                color: const Color(0xffeeeeee),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            ListTile(
                title: const Text('Describtion'),
                subtitle: Text(widget.recipe.describition ?? "")),
            ListTile(
              title: const Text('Ingredients'),
              subtitle: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('ingredients')
                      .where('user_ids',
                          arrayContains: FirebaseAuth.instance.currentUser!.uid)
                      .get(),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      var userIngredients = List<Ingredient>.from(snapShot
                          .data!.docs
                          .map((e) => Ingredient.fromJson(e.data(), e.id))
                          .toList());

                      var userIngredientsTitles =
                          userIngredients.map((e) => e.name).toList();
                      Widget checkIngredientWidget(String recipeIngredient) {
                        bool isExsist = false;
                        for (var userIngredientsTitle
                            in userIngredientsTitles) {
                          if (recipeIngredient
                              .contains(userIngredientsTitle!)) {
                            isExsist = true;
                            break;
                          } else {
                            isExsist = false;
                          }
                        }

                        if (isExsist) {
                          return const Icon(Icons.check);
                        } else {
                          return const Icon(Icons.close);
                        }
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.recipe.ingredients
                                ?.map((e) => Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          e,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        checkIngredientWidget(e)
                                      ],
                                    ))
                                .toList() ??
                            [],
                      );
                    }
                  }),
            ),
            SizedBox(
              height: 550,
              child: ListTile(
                  title: const Text('Directions'),
                  subtitle: Text(widget.recipe.directions.toString())),
            )
          ],
        ),
      ),
    );
  }
}
