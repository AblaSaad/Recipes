import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/recipes_provider.dart';
import 'package:recipes/widget/recipes_widget.dart';

class AllRecipes extends StatefulWidget {
  const AllRecipes({super.key});

  @override
  State<AllRecipes> createState() => _AllRecipesState();
}

class _AllRecipesState extends State<AllRecipes> {
  @override
  void initState() {
    Provider.of<RecipesProvider>(context, listen: false).getRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<RecipesProvider>(
            builder: (ctx, recipesProvider, _) =>
                recipesProvider.recipesList == null
                    ? const CircularProgressIndicator()
                    : (recipesProvider.recipesList?.isEmpty ?? false)
                        ? const Text('No Data Found')
                        : FlexibleGridView(
                            axisCount: GridLayoutEnum.twoElementsInRow,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            children: recipesProvider.recipesList!
                                .map((e) => RecipeWidget(recipe: e))
                                .toList(),
                          )));
  }
}