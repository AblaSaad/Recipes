import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:recipes/models/recipe_model.dart';
import '../utilis/toast_message_status.dart';
import '../view/widget/toast_message.widget.dart';

class RecipesProvider extends ChangeNotifier {
  Map<String, dynamic> filter = {
    "type": "",
    "calories": 0,
    "servings": 0,
    "total_time": 0,
  };

  List<Recipe>? _recipesList;

  List<Recipe>? get recipesList => _recipesList;

  List<Recipe>? _filteredList;

  List<Recipe>? get filteredList => _filteredList;

  List<Recipe>? _freshRecipesList;

  List<Recipe>? get freshRecipesList => _freshRecipesList;

  List<Recipe>? _recommandedRecipesList;

  List<Recipe>? get recommandedRecipesList => _recommandedRecipesList;

  Recipe? openedRecipe;

  Future<void> getFilteredRecipes() async {
    try {
      OverlayLoadingProgress.start();
      Query<Map<String, dynamic>>? result;
      var ref = FirebaseFirestore.instance.collection("recipes");
      for (var entry in filter.entries) {
        result = ref.where(entry.key, isEqualTo: entry.value);
      }

      var filterRecipes = await result?.get();
      if (filterRecipes?.docs.isNotEmpty ?? false) {
        _filteredList = List<Recipe>.from(
          filterRecipes!.docs.map(
            (doc) => Recipe.fromJson(doc.data(), doc.id),
          ),
        );
      } else {
        _filteredList = [];
      }
      notifyListeners();
      OverlayLoadingProgress.stop();
    } catch (e) {
      OverlayLoadingProgress.stop();

      OverlayToastMessage.show(
        widget: const ToastMessageWidget(
          message: " Filtered Faild",
          toastMessageStatus: ToastMessageStatus.failed,
        ),
      );
    }
  }

  Future<void> getSelectedRecipe(String recipeId) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('recipes')
          .doc(recipeId)
          .get();
      if (result.data() != null) {
        openedRecipe = Recipe.fromJson(result.data()!, result.id);
      } else {
        return;
      }
      notifyListeners();
    } catch (e) {
      print('>>>>>error in update recipe');
    }
  }

  Future<void> getRecipes() async {
    try {
      var result = await FirebaseFirestore.instance.collection('recipes').get();

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

  Future<void> getFreshRecipes() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('recipes')
          .where('isFresh', isEqualTo: true)
          .limit(4)
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

  Future<void> getRecommandedRecipes() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('recipes')
          .where('isFresh', isEqualTo: false)
          .limit(4)
          .get();
      if (result.docs.isNotEmpty) {
        _recommandedRecipesList = List<Recipe>.from(
            result.docs.map((doc) => Recipe.fromJson(doc.data(), doc.id)));
      } else {
        _recommandedRecipesList = [];
      }
      notifyListeners();
    } catch (e) {
      _recommandedRecipesList = [];
      notifyListeners();
    }
  }

  void addRecentlyViewedRecipeToUser(String recipeId) async {
    try {
      await FirebaseFirestore.instance
          .collection('recipes')
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
          .collection('recipes')
          .doc(recipeId)
          .update({
        "recently_viewed_user_ids":
            FieldValue.arrayRemove([FirebaseAuth.instance.currentUser?.uid])
      });
    } catch (e) {}
  }

  Future<void> addFavourietRecipeToUser(String recipeId, bool isAdd) async {
    try {
      OverlayLoadingProgress.start();
      if (isAdd) {
        await FirebaseFirestore.instance
            .collection('recipes')
            .doc(recipeId)
            .update({
          "favourites_user_ids":
              FieldValue.arrayUnion([FirebaseAuth.instance.currentUser?.uid])
        });
      } else {
        await FirebaseFirestore.instance
            .collection('recipes')
            .doc(recipeId)
            .update({
          "favourites_user_ids":
              FieldValue.arrayRemove([FirebaseAuth.instance.currentUser?.uid])
        });
      }
      await _updateRecipe(recipeId);
      OverlayLoadingProgress.stop();
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

  Future<void> _updateRecipe(String recipeId) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('recipes')
          .doc(recipeId)
          .get();
      Recipe? updatedRecipe;
      if (result.data() != null) {
        updatedRecipe = Recipe.fromJson(result.data()!, result.id);
      } else {
        return;
      }

      var recipesListIndex =
          recipesList?.indexWhere((recipe) => recipe.docId == recipeId);

      if (recipesListIndex != -1) {
        recipesList?.removeAt(recipesListIndex!);
        recipesList?.insert(recipesListIndex!, updatedRecipe);
      }

      var freshRecipesListIndex =
          freshRecipesList?.indexWhere((recipe) => recipe.docId == recipeId);

      if (freshRecipesListIndex != -1) {
        freshRecipesList?.removeAt(freshRecipesListIndex!);
        freshRecipesList?.insert(freshRecipesListIndex!, updatedRecipe);
      }

      var recommandedRecipesListIndex = recommandedRecipesList
          ?.indexWhere((recipe) => recipe.docId == recipeId);

      if (recommandedRecipesListIndex != -1) {
        recommandedRecipesList?.removeAt(recommandedRecipesListIndex!);
        recommandedRecipesList?.insert(
            recommandedRecipesListIndex!, updatedRecipe);
      }

      notifyListeners();
    } catch (e) {
      print('>>>>>error in update recipe');
    }
  }
}
