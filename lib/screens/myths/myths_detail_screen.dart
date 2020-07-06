import 'package:flutter/material.dart';
import 'package:trackcorona/viewmodels/myths/myths_view_model.dart';

class MythsDetailScreen extends StatelessWidget {
  final MythsViewModel myths;

  MythsDetailScreen({@required this.myths});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Myths (भ्रम)"),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          this.myths.imageUrl != ""
              ? Image.network(
                  this.myths.imageUrl,
                )
              : Image.asset(
                  "assets/myths/dummy_myths.jpg",
                ),
          Text(
            "${this.myths.myth.toString()}",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.left,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "${this.myths.reality}",
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.left,
            ),
          ),
          Text(
            "source Name ${this.myths.sourceName}",
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.left,
          ),
        ]),
      ),
    );
  }
}
