import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/recipes_provider.dart';
import 'package:recipes/view/widget/recommend_widget.dart';

class RecommendedRecippes extends StatefulWidget {
  const RecommendedRecippes({super.key});

  @override
  State<RecommendedRecippes> createState() => _RecommendedRecippesState();
}

class _RecommendedRecippesState extends State<RecommendedRecippes> {
  @override
  void initState() {
    Provider.of<RecipesProvider>(context, listen: false)
        .getRecommandedRecipes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesProvider>(
        builder: (ctx, recipesProvider, _) => recipesProvider
                    .recommandedRecipesList ==
                null
            ? const CircularProgressIndicator()
            : (recipesProvider.recommandedRecipesList?.isEmpty ?? false)
                ? const Text('No Data Found')
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: recipesProvider.recommandedRecipesList!.length,
                    itemBuilder: (ctx, index) => RecommendWidget(
                          recipe:
                              recipesProvider.recommandedRecipesList![index],
                        )));
  }
}
