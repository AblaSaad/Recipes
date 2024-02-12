import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/ingredients_provider.dart';

class IngredientsPage extends StatefulWidget {
  const IngredientsPage({super.key});

  @override
  State<IngredientsPage> createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  @override
  void initState() {
    Provider.of<IngredientsProvider>(context, listen: false).getIngredients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<IngredientsProvider>(
          builder: (ctx, ingredientProvider, _) =>
              ingredientProvider.ingredientsList == null
                  ? const CircularProgressIndicator()
                  : (ingredientProvider.ingredientsList?.isEmpty ?? false)
                      ? const Text('No Data Found')
                      : ListView.builder(
                          itemCount: ingredientProvider.ingredientsList!.length,
                          itemBuilder: (ctx, index) => ListTile(
                                leading: Checkbox(
                                    value: ingredientProvider
                                        .ingredientsList![index].user_ids
                                        ?.contains(FirebaseAuth
                                            .instance.currentUser?.uid),
                                    onChanged: (value) {
                                      ingredientProvider.addIngredientToUser(
                                          ingredientProvider
                                              .ingredientsList![index].docId!,
                                          value ?? false);
                                    }),
                                title: Text(ingredientProvider
                                        .ingredientsList![index].name ??
                                    'No Name'),
                              ))),
    );
  }
}
