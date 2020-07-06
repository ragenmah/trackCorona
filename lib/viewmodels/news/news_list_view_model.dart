import 'package:flutter/material.dart';
import 'package:trackcorona/models/news.dart';
import 'package:trackcorona/services/web_services.dart';
import 'package:trackcorona/viewmodels/news/news_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NewsViewModel> news = new List<NewsViewModel>();
  // MapType mapType = MapType.normal;

  void allNEWS() async {
    List<NEWS> newsList = await WebServices().fetchAllNews();
    notifyListeners();

    this.news = newsList.map((detail) => NewsViewModel(news: detail)).toList();
    if (this.news.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
