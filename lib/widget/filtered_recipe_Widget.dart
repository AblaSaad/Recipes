import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/recipes_provider.dart';
import 'package:recipes/widget/recipes_widget.dart';

class FilteredRecipesWidget extends StatefulWidget {
  const FilteredRecipesWidget({super.key});

  @override
  State<FilteredRecipesWidget> createState() => _FilteredRecipesWidgetState();
}

class _FilteredRecipesWidgetState extends State<FilteredRecipesWidget> {
  @override
  void initState() {
    Provider.of<RecipesProvider>(context, listen: false).getRecipes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesProvider>(
        builder: (ctx, recipesProvider, _) =>
            recipesProvider.filteredList == null
                ? const CircularProgressIndicator()
                : (recipesProvider.filteredList?.isEmpty ?? false)
                    ? const Text('No Data Found')
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: recipesProvider.filteredList!.length,
                        itemBuilder: (ctx, index) => RecipeWidget(
                              recipe: recipesProvider.filteredList![index],
                            )));
  }
}
