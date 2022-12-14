import 'package:flutter/material.dart';

Widget teamStat(String team, String logo, String teamName) {
  return Expanded(
      child: Column(
    children: [
      Text(
        team,
        style: TextStyle(fontSize: 20.0),
      ),
      SizedBox(
        height: 10.0,
      ),
      Expanded(
          child: Image.network(
        logo,
        width: 54.0,
      )),
      SizedBox(
        height: 10.0,
      ),
      Text(
        teamName,
        style: TextStyle(fontSize: 18.0),
      ),
    ],
  ));
}
