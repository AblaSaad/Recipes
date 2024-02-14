import 'package:flutter/material.dart';
import 'package:recipes/services/meal_service.dart';

// ignore: must_be_immutable
class DefaultFilterState extends StatefulWidget {
  final Map<String, dynamic> filter;
  final VoidCallback apply;
  double servingvalue;
  double caloriesvalue;
  double total_timevalue;
  DefaultFilterState(
      {super.key,
      required this.filter,
      required this.apply,
      required this.servingvalue,
      required this.caloriesvalue,
      required this.total_timevalue});

  @override
  State<DefaultFilterState> createState() => _DefaultFilterState();
}

class _DefaultFilterState extends State<DefaultFilterState> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meal',
              style: TextStyle(fontSize: 18.0),
            ),
            Center(
              child: Wrap(
                spacing: 10.0,
                children: MealTypes.values
                    .map(
                      (type) => FilterChip(
                        side: const BorderSide(color: Colors.grey),
                        backgroundColor: Colors.grey.shade300,
                        selectedColor: Color(0xffF55A00),
                        checkmarkColor: widget.filter.containsValue(type.name)
                            ? Colors.white
                            : Colors.transparent,
                        label: Text(type.name,
                            style: TextStyle(
                                color: widget.filter.containsValue(type.name)
                                    ? Colors.white
                                    : Color(0xffF55A00))),
                        selected: widget.filter.containsValue(type.name),
                        onSelected: (selected) {
                          setState(
                            () {
                              widget.filter["mealType"] =
                                  selected ? type.name : "";
                            },
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
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
                    value: widget.servingvalue,
                    divisions: 5,
                    label: '${widget.servingvalue.round()}',
                    onChanged: (value) {
                      setState(() {
                        widget.servingvalue = value;
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
                    max: 300.0,
                    value: widget.total_timevalue,
                    divisions: 150,
                    label: '${widget.total_timevalue.round()}',
                    onChanged: (value) {
                      setState(() {
                        widget.total_timevalue = value;
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
                    value: widget.caloriesvalue,
                    divisions: 500,
                    label: '${widget.caloriesvalue.round()}',
                    onChanged: (value) {
                      setState(() {
                        widget.caloriesvalue = value;
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
                    fixedSize: const Size(400, 50),
                    backgroundColor: const Color(0xffF55A00)),
                onPressed: widget.apply,
                child:
                    const Text('Apply', style: TextStyle(color: Colors.white))),
          ],
        ));
  }
}
