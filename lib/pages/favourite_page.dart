// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SafeArea(
              child: ListView(
            children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Favourites',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          fontFamily: 'Hellix_Medium 12'),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
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
                    ]),
              ]),
              SizedBox(height: 10),
              Card(
                elevation: 2,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xffeeeeee),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/blueberry.png"),
                            height: 60,
                            width: 100,
                            fit: BoxFit.fitWidth,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Breakfast",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff128FAE)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'Blueberry Muffins',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Color(0xffF55A00),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Color(0xffF55A00),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Color(0xffF55A00),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.black38,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.black38,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Text(
                                    "120 calories",
                                    style: TextStyle(
                                        color: Color(0xffF55A00), fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.access_time_rounded,
                                    size: 12,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "15 mins",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black38),
                                  ),
                                  Icon(
                                    Icons.room_service_outlined,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "1 Serving",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black38),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Color(0xffF55A00),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 2,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xffeeeeee),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/blueberry.png"),
                            height: 60,
                            width: 100,
                            fit: BoxFit.fitWidth,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Breakfast",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff128FAE)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'Blueberry Muffins',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Color(0xffF55A00),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Color(0xffF55A00),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Color(0xffF55A00),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.black38,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.black38,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Text(
                                    "120 calories",
                                    style: TextStyle(
                                        color: Color(0xffF55A00), fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.access_time_rounded,
                                    size: 12,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "15 mins",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black38),
                                  ),
                                  Icon(
                                    Icons.room_service_outlined,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "1 Serving",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black38),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Color(0xffF55A00),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xffeeeeee),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xffeeeeee),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xffeeeeee),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xffeeeeee),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xffeeeeee),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xffeeeeee),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          )),
        ));
  }
}
