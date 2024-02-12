// import 'package:flutter/material.dart';
// import 'package:recipes/widget/filtered_recipe_Widget.dart';

// class FilterPage extends StatefulWidget {
//   const FilterPage({super.key});

//   @override
//   State<FilterPage> createState() => _FilterPageState();
// }

// class _FilterPageState extends State<FilterPage> {
//   var selectedUserValue = {};
//   double _servingvalue = 2.0;
//   double _timevalue = 2;
//   double _caloriesvalue = 1.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Filter'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
//               child: Wrap(spacing: 10, children: [
//                 const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Meal',
//                     style: TextStyle(fontSize: 18.0),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     selectedUserValue['type'] = "breakfast";
//                     setState(() {});
//                   },
//                   child: Chip(
//                     label: const Text('Breakfast'),
//                     backgroundColor: selectedUserValue['type'] == "breakfast"
//                         ? const Color(0xffF55A00)
//                         : Colors.grey,
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     selectedUserValue['type'] = "launch";
//                     setState(() {});
//                   },
//                   child: Chip(
//                     label: const Text('Launch'),
//                     backgroundColor: selectedUserValue['type'] == "launch"
//                         ? const Color(0xffF55A00)
//                         : Colors.grey,
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     selectedUserValue['type'] = "dinner";
//                     setState(() {});
//                   },
//                   child: Chip(
//                     label: const Text('Dinner'),
//                     backgroundColor: selectedUserValue['type'] == "dinner"
//                         ? const Color(0xffF55A00)
//                         : Colors.grey,
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   ),
//                 ),
//               ]),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Container(
//               height: 2,
//               decoration: BoxDecoration(
//                 color: const Color(0xffeeeeee),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Serving',
//                       style: TextStyle(fontSize: 18.0),
//                     ),
//                   ),
//                   Slider(
//                     min: 0.0,
//                     max: 10.0,
//                     value: _servingvalue,
//                     divisions: 5,
//                     label: '${_servingvalue.round()}',
//                     onChanged: (value) {
//                       setState(() {
//                         _servingvalue = value;
//                       });
//                     },
//                     activeColor: const Color(
//                         0xffF55A00), // Sets the color of the active track
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Preparation Time',
//                       style: TextStyle(fontSize: 18.0),
//                     ),
//                   ),
//                   Slider(
//                     min: 0.0,
//                     max: 100.0,
//                     value: _timevalue,
//                     divisions: 50,
//                     label: '${_timevalue.round()}',
//                     onChanged: (value) {
//                       setState(() {
//                         _timevalue = value;
//                       });
//                     },
//                     activeColor: const Color(
//                         0xffF55A00), // Sets the color of the active track
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Calories',
//                       style: TextStyle(fontSize: 18.0),
//                     ),
//                   ),
//                   Slider(
//                     min: 0.0,
//                     max: 500,
//                     value: _caloriesvalue,
//                     divisions: 500,
//                     label: '${_caloriesvalue.round()}',
//                     onChanged: (value) {
//                       setState(() {
//                         _caloriesvalue = value;
//                       });
//                     },
//                     activeColor: const Color(
//                         0xffF55A00), // Sets the color of the active track
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 60,
//             ),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     fixedSize: Size(400, 50),
//                     backgroundColor: Color(0xffF55A00)),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => const FilteredRecipesWidget()));
//                 },
//                 child: Text('Apply', style: TextStyle(color: Colors.white))),
//           ],
//         ),
//       ),
//     );
//   }
// }
