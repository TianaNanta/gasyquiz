import 'package:flutter/material.dart';

import 'pages/add_questions.dart';
import 'pages/home.dart';
import 'pages/index.dart';
import 'pages/inscription.dart';
import 'pages/questions.dart';
import 'pages/score.dart';


void main() {
  var api_url = "";
  var api_key = "";

  runApp(MaterialApp(
    initialRoute: '/index',
    routes: {
      '/home': (ctx) => Home(),
      '/inscription': (ctx) => Inscription(),
      '/index': (ctx) => Index(),
      '/questions': (ctx) => Questions(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(

        body: Home(),
        // body: Home(),
        // body: Index(),
        // body: Inscription(),
        // body: Questions(),
        // body: Score(),

      ),
    );
  }
}
