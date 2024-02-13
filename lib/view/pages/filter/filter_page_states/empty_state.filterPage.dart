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
            "assets/images/error.gif",
            scale: 1,
          ),
          const Text(
            "No recipes match !",
            style: TextStyle(
              fontSize: 15,
              color: Color(0xffF55A00),
            ),
          ),
        ],
      ),
    );
  }
}
