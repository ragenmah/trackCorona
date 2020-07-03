import 'package:flutter/material.dart';
import 'package:trackcorona/models/hospital.dart';
import 'package:trackcorona/models/podcasts.dart';
import 'package:trackcorona/services/web_services.dart';
import 'package:trackcorona/viewmodels/hospital/hospital_view_model.dart';
import 'package:trackcorona/viewmodels/podcasts/podcasts_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class PodcastsListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<PodcastsViewModel> podcasts = new List<PodcastsViewModel>();
  // MapType mapType = MapType.normal;

  void allPodcastss() async {
    List<Podcasts> podcastslist = await WebServices().fetchAllPodcasts();
    notifyListeners();

    this.podcasts = podcastslist
        .map((detail) => PodcastsViewModel(podcasts: detail))
        .toList();
    if (this.podcasts.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
