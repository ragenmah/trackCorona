import 'package:flutter/material.dart';
import 'package:trackcorona/models/myths.dart';
import 'package:trackcorona/services/web_services.dart';
import 'package:trackcorona/viewmodels/faqs/faqs_view_model.dart';
import 'package:trackcorona/viewmodels/myths/myths_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class MythsListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<MythsViewModel> myths = new List<MythsViewModel>();
  // MapType mapType = MapType.normal;

  Future allMyths() async {
    List<Myths> mythslist = await WebServices().fetchAllMyths();
    notifyListeners();

    this.myths =
        mythslist.map((detail) => MythsViewModel(myths: detail)).toList();
    if (this.myths.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
    return mythslist;
  }
}
