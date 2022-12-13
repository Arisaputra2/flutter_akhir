import 'package:flutter/material.dart';
import 'package:flutter_live_score/api_manager.dart';
import 'package:flutter_live_score/berita.dart';
import 'package:flutter_live_score/detail.dart';
import 'package:flutter_live_score/pagebody.dart';

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
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 155, 1, 13),
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: ('Home'),
                // backgroundColor: Colors.white
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: ('Acara'),
                // backgroundColor: Colors.white
              ),
            ],
            selectedItemColor: Colors.white,
            onTap: (index) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            }));
  }
}
