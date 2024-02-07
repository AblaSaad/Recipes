import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/filter%20page/filter%20page%20states/default_state.filterPage.dart';
import 'package:recipes/filter%20page/filter%20page%20states/empty_state.filterPage.dart';
import 'package:recipes/provider/recipes_provider.dart';
import 'package:recipes/utilis/colors.utilities.dart';
import 'package:recipes/widget/recommended_recipes_widget.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Map<String, dynamic> filter = {};
  var servingSlider = 0.0;
  var timeSlider = 0.0;
  var caloriesSlider = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(
          "Filter",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                setState(
                  () {
                    Provider.of<RecipesProvider>(context, listen: false);

                    filter.clear();
                    servingSlider = 0.0;
                    timeSlider = 0.0;
                    caloriesSlider = 0.0;
                  },
                );
              },
              child: const Text(
                "Reset",
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Consumer<RecipesProvider>(
        builder: (context, filteredRecipes, _) =>
            filteredRecipes.filteredList == null
                ? DefaultFilterState(
                    filter: filter,
                    applyButton: () async {
                      Provider.of<RecipesProvider>(context, listen: false)
                          .getFilteredResult();
                    },
                    servingSlider: servingSlider,
                    caloriesSlider: caloriesSlider,
                    timeSlider: timeSlider)
                : filteredRecipes.filteredList!.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListView.builder(
                          itemCount: filteredRecipes.filteredList!.length,
                          itemBuilder: (context, index) => RecommendedRecippes(
                              // recipe: filteredRecipes.filteredList![index],
                              ),
                        ),
                      )
                    : const EmptyFilterState(),
      ),
    );
  }
}
