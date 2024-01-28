// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe_model.dart';
import 'package:recipes/widget/recipes_widget.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('my_recipes')
              .where("favourite_users_ids",
                  arrayContains: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshots.hasError) {
                return const Text('Error when get data');
              } else {
                if (snapshots.hasData) {
                  List<Recipe> recipesList = snapshots.data?.docs
                          .map((e) => Recipe.fromJson(e.data(), e.id))
                          .toList() ??
                      [];
                  return FlexibleGridView(
                    axisCount: GridLayoutEnum.twoElementsInRow,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: recipesList
                        .map((e) => RecipeWidget(recipe: e))
                        .toList(),
                  );
                } else {
                  return const Text('No Data Found');
                }
              }
            }
          }),
    );
  }
}
