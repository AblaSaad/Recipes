// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Abla Saad"),
              accountEmail: Text("bella@gmail.com"),
              currentAccountPicture: CircleAvatar(),
            ),
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {}),
            ListTile(
                leading: const Icon(Icons.favorite_border_outlined),
                title: const Text("Favourites"),
                onTap: () {}),
            ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text("Shopping"),
                onTap: () {}),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {}),
            ListTile(
                leading: const Icon(Icons.power_settings_new),
                title: const Text("Logout"),
                onTap: () {
                  Provider.of<AppAuthProvider>(context, listen: false)
                      .signOut(context);
                }),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
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
                          fontSize: 8,
                          fontFamily: 'Hellix_Medium 12'),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'What Would You like to cook Today?',
                      style: TextStyle(color: Color(0xff1F222B)),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(
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
                          child: Row(children: const [
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
                          child: Image(
                              image: AssetImage('assets/images/filter.png')))
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                AdsWidget(),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Today's Fresh Recipes",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontFamily: 'Hellix medium 14',
                          color: Color(0xffF55A00),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(alignment: Alignment.centerLeft, child: FreshRecipes()),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Recommended",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontFamily: 'Hellix medium 14',
                          color: Color(0xffF55A00),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: RecommendedRecippes()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
