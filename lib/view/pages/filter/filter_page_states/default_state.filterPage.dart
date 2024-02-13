import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultFilterState extends StatefulWidget {
  final Map<String, dynamic> filter;
  final VoidCallback applyButton;
  double servingSlider;
  double caloriesSlider;
  double timeSlider;
  DefaultFilterState(
      {super.key,
      required this.filter,
      required this.applyButton,
      required this.servingSlider,
      required this.caloriesSlider,
      required this.timeSlider});

  @override
  State<DefaultFilterState> createState() => _DefaultFilterState();
}

class _DefaultFilterState extends State<DefaultFilterState> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Wrap(spacing: 10, children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Meal',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              InkWell(
                onTap: () {
                  widget.filter['MealTypes'] = "breakfast";
                  setState(() {});
                },
                child: Chip(
                  label: const Text('Breakfast'),
                  backgroundColor: widget.filter['MealTypes'] == "breakfast"
                      ? const Color(0xffF55A00)
                      : Colors.grey,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
              ),
              InkWell(
                onTap: () {
                  widget.filter['MealTypes'] = "launch";
                  setState(() {});
                },
                child: Chip(
                  label: const Text('Launch'),
                  backgroundColor: widget.filter['MealTypes'] == "launch"
                      ? const Color(0xffF55A00)
                      : Colors.grey,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
              ),
              InkWell(
                onTap: () {
                  widget.filter['MealTypes'] = "dinner";
                  setState(() {});
                },
                child: Chip(
                  label: const Text('Dinner'),
                  backgroundColor: widget.filter['type'] == "dinner"
                      ? const Color(0xffF55A00)
                      : Colors.grey,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 40,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Serving',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Slider(
                  min: 0.0,
                  max: 10.0,
                  value: widget.servingSlider,
                  divisions: 5,
                  label: '${widget.servingSlider.round()}',
                  onChanged: (value) {
                    setState(() {
                      widget.servingSlider = value;
                    });
                  },
                  activeColor: const Color(
                      0xffF55A00), // Sets the color of the active track
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total Time',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Slider(
                  min: 0.0,
                  max: 100.0,
                  value: widget.timeSlider,
                  divisions: 50,
                  label: '${widget.timeSlider.round()}',
                  onChanged: (value) {
                    setState(() {
                      widget.timeSlider = value;
                    });
                  },
                  activeColor: const Color(0xffF55A00),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Calories',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Slider(
                  min: 0.0,
                  max: 500,
                  value: widget.caloriesSlider,
                  divisions: 500,
                  label: '${widget.caloriesSlider.round()}',
                  onChanged: (value) {
                    setState(() {
                      widget.caloriesSlider = value;
                    });
                  },
                  activeColor: const Color(0xffF55A00),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(400, 50), backgroundColor: Color(0xffF55A00)),
              onPressed: widget.applyButton,
              child: Text('Apply', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
