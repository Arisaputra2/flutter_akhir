import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_live_score/berita.dart';
import 'package:flutter_live_score/soccermodel.dart';
import 'package:http/http.dart' as http;

class SoccerApi {
  final String apiUrl = "https://v3.football.api-sports.io/fixtures?live=all";
  static const api_Key = "b63d1462a77beb56a259cf9d3a563bd2";

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': api_Key
  };
  Future<List<SoccerMatch>> getAllmatches() async {
    final response = await http.get(Uri.parse(apiUrl), headers: headers);
    // Response res = await get(apiUrl, headers: headers);
    var body;

    if (response.statusCode == 200) {
      body = jsonDecode(response.body);
      List<dynamic> matchesList = body['response'];
      print("Api service : ${body}");
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    }
    return body;
  }
}
