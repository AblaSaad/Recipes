// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class FreshRecipes extends StatelessWidget {
  const FreshRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                  width: 130,
                  height: 210,
                  decoration: BoxDecoration(
                    color: Color(0xffF7F8FC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            height: 110,
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 10),
                                  child:
                                      const Icon(Icons.favorite_border_rounded),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                      'assets/images/frensh_toast.png')),
                            ]),
                          ),
                          Text(
                            "Breakfast",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff128FAE)),
                          ),
                          Text(
                            "French Toast with Berries",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
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
                                color: Color(0xffF55A00),
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Color(0xffF55A00),
                              ),
                            ],
                          ),
                          Text(
                            "120 calories",
                            style: TextStyle(
                                color: Color(0xffF55A00), fontSize: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: 10,
                                color: Colors.grey,
                              ),
                              Text(
                                "10 mins",
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.grey.withOpacity(0.6)),
                              ),
                              Icon(
                                Icons.room_service_outlined,
                                size: 12,
                                color: Colors.grey,
                              ),
                              Text(
                                "1 Serving",
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.grey.withOpacity(0.5)),
                              )
                            ],
                          )
                        ],
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                  width: 130,
                  height: 210,
                  decoration: BoxDecoration(
                    color: Color(0xffF7F8FC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            height: 110,
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Color(0xffF55A00),
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                      'assets/images/Cinnamon_Toaast.png')),
                            ]),
                          ),
                          Text(
                            "Breakfast",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff128FAE)),
                          ),
                          Text(
                            "Brown Sugar Cinnamon Toast",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
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
                                color: Color(0xffF55A00),
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          Text(
                            "135 calories",
                            style: TextStyle(
                                color: Color(0xffF55A00), fontSize: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: 10,
                                color: Colors.grey,
                              ),
                              Text(
                                "15 mins",
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.grey.withOpacity(0.6)),
                              ),
                              Icon(
                                Icons.room_service_outlined,
                                size: 12,
                                color: Colors.grey,
                              ),
                              Text(
                                "1 Serving",
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.grey.withOpacity(0.5)),
                              )
                            ],
                          )
                        ],
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
