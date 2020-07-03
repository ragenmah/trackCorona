import 'package:flutter/material.dart';
import 'package:trackcorona/models/hospital.dart';
import 'package:trackcorona/services/web_services.dart';
import 'package:trackcorona/viewmodels/hospital/hospital_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}
// enum MapType {
//   satellite,
//   hybrid,
//   normal,
//   terrain,
// }

class HospitalListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<HospitalViewModel> hospitals = new List<HospitalViewModel>();
  // MapType mapType = MapType.normal;

  void allHospitals() async {
    List<Hospital> hospitallist = await WebServices().fetchAllHospitals();
    notifyListeners();

    this.hospitals = hospitallist
        .map((detail) => HospitalViewModel(hospital: detail))
        .toList();
    if (this.hospitals.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
