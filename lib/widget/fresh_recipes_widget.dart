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
            Card(
              elevation: 2,
              child: Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: Color(0xffeeeeee),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 15, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.favorite_outline,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  Transform.translate(
                                    offset: Offset(20, 0),
                                    child: Image.asset(
                                      'assets/images/french_toast.png',
                                      height: 140,
                                      width: 170,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Breakfast",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff128FAE)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Text(
                                  'Fresh Toast With Barries',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: 12,
                                color: Colors.grey,
                              ),
                              Text(
                                "10 mins",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.withOpacity(0.6)),
                              ),
                              Icon(
                                Icons.room_service_outlined,
                                size: 15,
                                color: Colors.grey,
                              ),
                              Text(
                                "1 Serving",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.withOpacity(0.5)),
                              )
                            ],
                          )
                        ],
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
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
                                      'assets/images/cinnamon_toast.png')),
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
