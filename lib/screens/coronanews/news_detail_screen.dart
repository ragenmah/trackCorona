import 'package:flutter/material.dart';
import 'package:trackcorona/viewmodels/news/news_view_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsViewModel news;

  NewsDetailScreen({@required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("news (समाचारहरु)"),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          this.news.imageUrl != ""
              ? Image.network(
                  this.news.imageUrl,
                )
              : Image.asset(
                  "assets/news/dummy_news.jpg",
                ),
          Text(
            "${this.news.title.toString()}",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.left,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "${this.news.summary}",
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.left,
            ),
          ),
          Text(
            "source Name ${this.news.sourceName}",
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.left,
          ),
        ]),
      ),
    );
  }
}
