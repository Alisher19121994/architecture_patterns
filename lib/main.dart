import 'package:architecture_patterns/patterns_type/introduction/home_page.dart';
import 'package:architecture_patterns/patterns_type/setState_pattern/pages/create.dart';
import 'package:architecture_patterns/patterns_type/setState_pattern/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // home:  Homes(),
      home:  HomePage(),
      routes: {
        Creates.id:(context)=> Creates(),
      },
    );
  }
}

