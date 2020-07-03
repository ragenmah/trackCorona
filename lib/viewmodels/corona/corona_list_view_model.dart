import 'package:flutter/material.dart';
import 'package:trackcorona/models/corona.dart';
import 'package:trackcorona/services/web_services.dart';
import 'package:trackcorona/viewmodels/corona/corona_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class CoronaListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<CoronaViewModel> coronaDetails = new List<CoronaViewModel>();
  // MapType mapType = MapType.normal;

  void allCoronaDetails() async {
    List<Corona> coronalist = await WebServices().fetchAllCoronaWorldDetails();
    notifyListeners();

    this.coronaDetails =
        coronalist.map((detail) => CoronaViewModel(corona: detail)).toList();
    if (this.coronaDetails.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
