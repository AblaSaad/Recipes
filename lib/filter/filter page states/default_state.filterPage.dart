// import 'package:flutter/material.dart';
// import 'package:recipes/services/meal_service.dart';
// import 'package:recipes/utilis/colors.utilities.dart';

// // ignore: must_be_immutable
// class DefaultFilterState extends StatefulWidget {
//   final Map<String, dynamic> filter;
//   final VoidCallback applyButton;
//   double servingSlider;
//   double caloriesSlider;
//   double timeSlider;
//   DefaultFilterState(
//       {super.key,
//       required this.filter,
//       required this.applyButton,
//       required this.servingSlider,
//       required this.caloriesSlider,
//       required this.timeSlider});

//   @override
//   State<DefaultFilterState> createState() => _DefaultFilterState();
// }

// class _DefaultFilterState extends State<DefaultFilterState> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Meal",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           Center(
//             child: Wrap(
//               spacing: 10.0,
//               children: MealTypes.values
//                   .map(
//                     (type) => FilterChip(
//                       side: BorderSide(color: Colors.grey.shade300),
//                       backgroundColor: Colors.grey.shade300,
//                       selectedColor: AppColors.primaryColor,
//                       checkmarkColor: widget.filter.containsValue(type.name)
//                           ? AppColors.white
//                           : AppColors.transparent,
//                       label: Text(
//                         type.name,
//                         style: TextStyle(
//                           color: widget.filter.containsValue(type.name)
//                               ? Colors.white
//                               : Color(0xffF55A00),
//                         ),
//                       ),
//                       selected: widget.filter.containsValue(type.name),
//                       onSelected: (selected) {
//                         setState(
//                           () {
//                             widget.filter["mealType"] =
//                                 selected ? type.name : "";
//                           },
//                         );
//                       },
//                     ),
//                   )
//                   .toList(),
//             ),
//           ),
//           ...MealDetails.values.map(
//             (details) => Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Divider(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   details.name,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Slider(
//                   value: details.name == "Serving"
//                       ? widget.servingSlider
//                       : details.name == "Calories"
//                           ? widget.caloriesSlider
//                           : widget.timeSlider,
//                   label: details.name == "Serving"
//                       ? widget.servingSlider.round().toString()
//                       : details.name == "Calories"
//                           ? widget.caloriesSlider.round().toString()
//                           : widget.timeSlider.round().toString(),
//                   max: details.name == "Serving"
//                       ? 10
//                       : details.name == "Calories"
//                           ? 1000
//                           : 120,
//                   divisions: details.name == "Serving" ? 5 : 10,
//                   onChanged: (serving) {
//                     details.name == "Serving"
//                         ? widget.servingSlider = serving
//                         : details.name == "Calories"
//                             ? widget.caloriesSlider = serving
//                             : widget.timeSlider = serving;
//                     details.name == "Serving"
//                         ? widget.filter["servings"] = widget.servingSlider
//                         : details.name == "Calories"
//                             ? widget.filter["mealCalories"] =
//                                 widget.caloriesSlider
//                             : widget.filter["mealTime"] = widget.timeSlider;
//                     setState(() {});
//                   },
//                 ),
//               ],
//             ),
//           ),
//           ElevatedButton(
//             onPressed: widget.applyButton,
//             style: ElevatedButton.styleFrom(
//                 fixedSize: Size(400, 50), backgroundColor: Color(0xffF55A00)),
//             child: const Text(
//               "Apply",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
