import 'package:flutter/material.dart';

class RecommendedRecippes extends StatefulWidget {
  const RecommendedRecippes({super.key});

  @override
  State<RecommendedRecippes> createState() => _RecommendedRecippesState();
}

class _RecommendedRecippesState extends State<RecommendedRecippes> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Column(
          children: [
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
