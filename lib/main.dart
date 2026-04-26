import 'package:flutter/material.dart';
import 'package:habbab/pages/main_screen.dart';

void main() {
  runApp(Habbab());
}

class Habbab extends StatelessWidget {
  const Habbab({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(), //
    );
  }
}
