import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:recipes/models/recipe_model.dart';
import '../utilis/toast_message_status.dart';
import '../widget/toast_message.widget.dart';

class RecipesProvider extends ChangeNotifier {
  List<Recipe>? _recipesList;
  List<Recipe>? get recipesList => _recipesList;
  List<Recipe>? _freshRecipesList;

  List<Recipe>? get freshRecipesList => _freshRecipesList;

  Future<void> getRecipes() async {
    try {
      var result =
          await FirebaseFirestore.instance.collection('my_recipes').get();

      if (result.docs.isNotEmpty) {
        _recipesList = List<Recipe>.from(
            result.docs.map((doc) => Recipe.fromJson(doc.data(), doc.id)));
      } else {
        _recipesList = [];
      }
      notifyListeners();
    } catch (e) {
      _recipesList = [];
      notifyListeners();
    }
  }

  Future<void> addFavourietRecipeToUser(String recipeId, bool isAdd) async {
    try {
      OverlayLoadingProgress.start();
      if (isAdd) {
        await FirebaseFirestore.instance
            .collection('my_recipes')
            .doc(recipeId)
            .update({
          "favourites_user_ids":
              FieldValue.arrayUnion([FirebaseAuth.instance.currentUser?.uid])
        });
      } else {
        await FirebaseFirestore.instance
            .collection('my_recipes')
            .doc(recipeId)
            .update({
          "favourites_user_ids":
              FieldValue.arrayRemove([FirebaseAuth.instance.currentUser?.uid])
        });
      }
      OverlayLoadingProgress.stop();
      getRecipes();
    } catch (e) {
      OverlayLoadingProgress.stop();
      OverlayToastMessage.show(
        widget: ToastMessageWidget(
          message: 'Error : ${e.toString()}',
          toastMessageStatus: ToastMessageStatus.failed,
        ),
      );
    }
  }

  Future<void> getFreshRecipes() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('my_recipes')
          .where('isFresh', isEqualTo: true)
          .limit(5)
          .get();

      if (result.docs.isNotEmpty) {
        _freshRecipesList = List<Recipe>.from(
            result.docs.map((doc) => Recipe.fromJson(doc.data(), doc.id)));
      } else {
        _freshRecipesList = [];
      }
      notifyListeners();
    } catch (e) {
      _freshRecipesList = [];
      notifyListeners();
    }
  }

  void addRecentlyViewedRecipeToUser(String recipeId) async {
    try {
      await FirebaseFirestore.instance
          .collection('my_recipes')
          .doc(recipeId)
          .update({
        "recently_viewed_user_ids":
            FieldValue.arrayUnion([FirebaseAuth.instance.currentUser?.uid])
      });
    } catch (e) {}
  }

  void removeRecipeToUserRecentlyViewed(String recipeId) async {
    try {
      await FirebaseFirestore.instance
          .collection('my_recipes')
          .doc(recipeId)
          .update({
        "recently_viewed_user_ids":
            FieldValue.arrayRemove([FirebaseAuth.instance.currentUser?.uid])
      });
    } catch (e) {}
  }
}
