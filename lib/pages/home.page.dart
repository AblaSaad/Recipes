// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:recipes/pages/alle_recipes_page.dart';
import 'package:recipes/pages/favourite_page.dart';
import 'package:recipes/pages/ingredients_page.dart';
import 'package:recipes/widget/fresh_recipes_widget.dart';
import 'package:recipes/widget/recommended_recipes_widget.dart';
import '../provider/app_auth_provider.dart';
import '../widget/ads_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ZoomDrawerController controller;

  @override
  void initState() {
    controller = ZoomDrawerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      menuBackgroundColor: Colors.white,
      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
      disableDragGesture: true,
      mainScreenTapClose: true,
      controller: controller,
      drawerShadowsBackgroundColor: Colors.grey,
      menuScreen: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            children: <Widget>[
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                accountName: Text(
                  "Abla Saad",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  "bella@gmail.com",
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(),
              ),
              ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {}),
              ListTile(
                onTap: () {
                  controller.close?.call();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => FavouritePage()));
                },
                leading: Icon(Icons.favorite_border_outlined),
                title: Text('Favourites'),
              ),
              ListTile(
                onTap: () {
                  controller.close?.call();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => IngredientsPage()));
                },
                leading: Icon(Icons.fastfood),
                title: Text('Ingredients'),
              ),
              ListTile(
                  leading: const Icon(Icons.play_arrow_rounded),
                  title: const Text("Recently Viewed"),
                  onTap: () {}),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {}),
              ListTile(
                onTap: () {
                  Provider.of<AppAuthProvider>(context, listen: false)
                      .signOut(context);
                },
                leading: Icon(Icons.power_settings_new),
                title: Text('Signout'),
              )
            ],
          ),
        ),
      ),
      mainScreen: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
                onTap: () {
                  controller.toggle!();
                },
                child: Icon(Icons.menu)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.notifications),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Bonjour, Abla',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: 'Hellix_Medium 12'),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'What Would You like to cook Today?',
                        style: TextStyle(color: Color(0xff1F222B)),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 40,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            child: const Row(children: [
                              Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                flex: 4,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search for recipes",
                                    hintStyle: TextStyle(
                                        fontSize: 12, color: Color(0xffB2B7C6)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ])),
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: const Image(
                                image: AssetImage('assets/images/filter.png')))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const AdsWidget(),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today's Fresh Recipes",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AllRecipes()));
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontFamily: 'Hellix medium 14',
                              color: Color(0xffF55A00),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: const Align(
                            alignment: Alignment.centerLeft,
                            child: FreshRecipes()),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommended",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AllRecipes()));
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontFamily: 'Hellix medium 14',
                              color: Color(0xffF55A00),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: RecommendedRecippes()),
                ],
              ),
            ),
          ),
        ),
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: -9.0,
    );
  }
}
