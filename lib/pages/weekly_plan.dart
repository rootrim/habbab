import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class WeeklyPlanScreen extends StatefulWidget {
  const WeeklyPlanScreen({super.key});

  @override
  State<WeeklyPlanScreen> createState() => _WeeklyPlanScreenState();
}

class _WeeklyPlanScreenState extends State<WeeklyPlanScreen> {
  // state burda
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Text('$counter');
  }
}
