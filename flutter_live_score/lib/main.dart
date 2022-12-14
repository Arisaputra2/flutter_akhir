import 'package:flutter/material.dart';
import 'package:flutter_live_score/api_manager.dart';
import 'package:flutter_live_score/berita.dart';
import 'package:flutter_live_score/detail.dart';
import 'package:flutter_live_score/soccer_live/pagebody.dart';
import 'package:flutter_live_score/soccer_live/soccerappbody.dart';
import 'package:flutter_live_score/soccer_live/soccerappbody.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
