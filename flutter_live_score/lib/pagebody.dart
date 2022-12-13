// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_live_score/goalstat.dart';
import 'package:flutter_live_score/matchtile.dart';
import 'package:flutter_live_score/teamstat.dart';
import 'soccermodel.dart';

Widget PageBody(List<SoccerMatch> allmatches) {
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                teamStat(
                    "Home", allmatches[0].home.logo, allmatches[0].home.name),
                goalStat(allmatches[0].fixture.status.elapsedTime,
                    allmatches[0].goal.home, allmatches[0].goal.away),
                teamStat(
                    "Away", allmatches[0].away.logo, allmatches[0].away.name),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: allmatches.length,
                  itemBuilder: (context, index) {
                    return matchTile(allmatches[index]);
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
