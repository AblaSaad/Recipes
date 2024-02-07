import 'package:flutter/material.dart';

class EmptyFilterState extends StatelessWidget {
  const EmptyFilterState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/Questions.gif",
            scale: 1.5,
          ),
          const Text(
            "Ooops, No Result Match Your Filter !",
            style: TextStyle(
              fontFamily: "Abril Fatface",
              fontSize: 15,
              color: Color(0xffF55A00),
            ),
          ),
        ],
      ),
    );
  }
}
