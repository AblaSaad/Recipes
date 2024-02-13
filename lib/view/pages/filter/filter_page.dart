import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/view/pages/filter/filter_page_states/default_state.filterPage.dart';
import 'package:recipes/view/pages/filter/filter_page_states/empty_state.filterPage.dart';
import 'package:recipes/provider/recipes_provider.dart';
import 'package:recipes/view/widget/recommend_widget.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Map<String, dynamic> filter = {};
  double servingSlider = 0.0;
  double timeSlider = 0;
  double caloriesSlider = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
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
                  color: Color(0xffF55A00),
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
                          .getFilteredRecipes();
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
                          itemBuilder: (context, index) => RecommendWidget(
                            recipe: filteredRecipes.filteredList![index],
                          ),
                        ),
                      )
                    : const EmptyFilterState(),
      ),
    );
  }
}
