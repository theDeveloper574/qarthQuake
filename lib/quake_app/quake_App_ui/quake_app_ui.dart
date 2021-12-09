
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quake extends StatefulWidget {

  @override
  _QuakeState createState() => _QuakeState();
}

class _QuakeState extends State<Quake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quake App"),
      ),
    );
  }
  Future<List> getData()async{
    String apiUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
    http.Response response = await http.get(Uri.http("earthquake.usgs.gov", apiUrl));
    return jsonDecode(response.body);
  }
}
