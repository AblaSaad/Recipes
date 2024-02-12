// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/recipes_provider.dart';
import 'package:recipes/view/widget/recipes_widget.dart';

class FreshRecipes extends StatefulWidget {
  const FreshRecipes({super.key});

  @override
  State<FreshRecipes> createState() => _FreshRecipesState();
}

class _FreshRecipesState extends State<FreshRecipes> {
  @override
  void initState() {
    Provider.of<RecipesProvider>(context, listen: false).getFreshRecipes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesProvider>(
        builder: (ctx, recipesProvider, _) =>
            recipesProvider.freshRecipesList == null
                ? const CircularProgressIndicator()
                : (recipesProvider.freshRecipesList?.isEmpty ?? false)
                    ? const Text('No Data Found')
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: recipesProvider.freshRecipesList!.length,
                        itemBuilder: (ctx, index) => RecipeWidget(
                              recipe: recipesProvider.freshRecipesList![index],
                            )));
  }
}
