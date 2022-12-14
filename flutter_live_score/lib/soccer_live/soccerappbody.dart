import 'package:flutter/material.dart';
import 'package:flutter_live_score/api_manager.dart';
import 'package:flutter_live_score/berita.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:flutter_live_score/soccer_live/pagebody.dart';

class SoccerApp extends StatefulWidget {
  const SoccerApp({super.key});

  @override
  State<SoccerApp> createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 155, 1, 13),
          elevation: 0.0,
          title: Text(
            "Live Score Bola",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: SoccerApi().getAllmatches(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return SizedBox.shrink();
            } else {
              if (snapshot.hasData) {
                print((snapshot.data!).length);
                return PageBody(snapshot.data!);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }
          },
        ),
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: Color.fromARGB(255, 155, 1, 13),
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.list, title: 'Berita')
            ],
            initialActiveIndex: 0,
            onTap: (int i) => setState(() {
                  _currentIndex = i;
                  if (i == 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Berita())));
                    //  Navigator.pushReplacementNamed(context, MaterialPageRoute(builder: ((context) => Berita()));
                  } else {}
                })));
  }
}
