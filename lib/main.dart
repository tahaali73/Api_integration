import 'package:api_integration/home_screens/example_two.dart';
import 'package:flutter/material.dart';

import 'home_screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: ExampleTwo(),
    );
  }
}
