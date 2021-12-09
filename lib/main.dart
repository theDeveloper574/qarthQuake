



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forassing/practice/pra.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:intl/intl.dart';

late Map _data;
late List _features;
void main() async{
  _data = await getData();
  _features = _data["features"];
  print(_features);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

Future<Map> getData()async{
  String apiUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  http.Response response = await http.get(Uri.parse(apiUrl));
  return jsonDecode(response.body);
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quake(),
    );
  }
}
class Quake extends StatefulWidget {

  @override
  _QuakeState createState() => _QuakeState();
}

class _QuakeState extends State<Quake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Quake App"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _features.length,
          itemBuilder: (ctx, int index){
            if(index.isOdd) return Divider();
            final positon = index ~/2;
            var format  = DateFormat.yMMMEd("en_US").add_jm();
            var date = format.format(DateTime.fromMillisecondsSinceEpoch(_features[index]['properties']['time'],isUtc: true));
            return ListTile(
              title: Text("At: $date", style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("${_features[positon]["properties"]['place']}"),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                  child: Text("${_features[positon]['properties']['mag']}", style: TextStyle(
                    color: Colors.white
                  ),)),
              onTap: (){
                _showAlertMessage(context, "${_features[positon]['properties']['title']}");
              },
            );
          },
        ),
      ),
    );
  }

  void _showAlertMessage(BuildContext ctx, String message) {
    showDialog(context: ctx, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Quakes"),
        content: Text(message),
        actions: [
          FlatButton(onPressed: (){
            Navigator.pop(ctx);
          }, child: Text("OK Dude"))
        ],
      );
    },);
  }
}


