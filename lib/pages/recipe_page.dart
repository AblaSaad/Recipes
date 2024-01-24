import 'package:flutter/material.dart';

class AllRecipes extends StatefulWidget {
  const AllRecipes({super.key});

  @override
  State<AllRecipes> createState() => _AllRecipesState();
}

class _AllRecipesState extends State<AllRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: 2,
        children: List<Widget>.generate(10, (index) {
          return GridTile(
            child: Card(
                color: const Color(0xffeeeeee),
                child: Center(
                  child: Text('tile $index'),
                )),
          );
        }),
      ),
    );
  }
}
