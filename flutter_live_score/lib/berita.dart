import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_live_score/detail.dart';
import 'package:flutter_live_score/soccer_live/soccerappbody.dart';
import 'package:http/http.dart' as http;
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Berita extends StatefulWidget {
  const Berita({super.key});

  @override
  State<Berita> createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  List _post = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Scaffold(
        appBar: AppBar(
          title: Text('Berita Bola'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 155, 1, 13),
        ),
        body: ListView.builder(
            itemCount: _post.length,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: Container(
                  color: Colors.grey[200],
                  height: 100,
                  width: 100,
                  child: _post[index]['urlToImage'] != null
                      ? Image.network(
                          _post[index]['urlToImage'],
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : Center(),
                ),
                title: Text(
                  '${_post[index]['title']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text('${_post[index]['description']}',
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => Detail(
                                url: _post[index]['url'],
                                title: _post[index]['title'],
                                content: _post[index]['content'],
                                publishedAt: _post[index]['publishedAt'],
                                author: _post[index]['author'],
                                urlToImage: _post[index]['urlToImage'],
                              )));
                },
              );
            })),
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: Color.fromARGB(255, 155, 1, 13),
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.list, title: 'Berita')
            ],
            initialActiveIndex: 1,
            onTap: (int i) => setState(() {
                  _currentIndex = i;
                  if (i == 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => SoccerApp())));
                  } else {}
                })));
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=id&category=sports&apiKey=783d168122624fd6973f088413f249a0'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _post = data['articles'];
          // print(_post);
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
