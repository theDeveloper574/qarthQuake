import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forassing/quake_app/quake_App_ui/modelClass.dart';
class pra extends StatefulWidget {
  @override
  _praState createState() => _praState();
}

class _praState extends State<pra> {
  var count = 8;
  double mul= 16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Class"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Text("Hello world"),
            )
          ],
        ),
      ),
    );
  }
}


