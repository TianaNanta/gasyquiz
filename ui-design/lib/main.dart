import 'package:flutter/material.dart';

import 'package:flutter_app/pages/add_questions.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/index.dart';
import 'package:flutter_app/pages/inscription.dart';
import 'package:flutter_app/pages/questions.dart';
import 'package:flutter_app/pages/score.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(

        body: AddQuestions(),
        // body: Home(),
        // body: Index(),
        // body: Inscription(),
        // body: Questions(),
        // body: Score(),

      ),
    );
  }
}
