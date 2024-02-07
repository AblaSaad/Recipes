import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe_model.dart';
import 'package:recipes/widget/recipes_widget.dart';

class RecentlyViewedPage extends StatefulWidget {
  const RecentlyViewedPage({super.key});

  @override
  State<RecentlyViewedPage> createState() => _RecentlyViewedPageState();
}

class _RecentlyViewedPageState extends State<RecentlyViewedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recently_Viewed '),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('recipes')
              .where("recently_viewed_user_ids",
                  arrayContains: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshots.hasError) {
                return const Text('ERROR when get Data');
              } else {
                if (snapshots.hasData) {
                  List<Recipe> recipesList = snapshots.data?.docs
                          .map((e) => Recipe.fromJson(e.data(), e.id))
                          .toList() ??
                      [];
                  return FlexibleGridView(
                    children: recipesList
                        .map((e) => RecipeWidget(recipe: e))
                        .toList(),
                    axisCount: GridLayoutEnum.twoElementsInRow,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
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
