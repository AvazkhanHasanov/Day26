import 'package:day_26_darsda/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Day26App());
}

class Day26App extends StatelessWidget {
  const Day26App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
