import 'package:flutter/material.dart';
import 'package:trackcorona/models/country.dart';
import 'package:trackcorona/services/web_services.dart';
import 'package:trackcorona/viewmodels/country_view_model.dart';

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

class CountryListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<CountryViewModel> countries = new List<CountryViewModel>();
  // MapType mapType = MapType.normal;

  void allCountries() async {
    List<Country> countrylist = await WebServices().fetchAllCountries();
    notifyListeners();

    this.countries =
        countrylist.map((detail) => CountryViewModel(country: detail)).toList();
    if (this.countries.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void selectedDetailOfCountry(String country) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<Country> countrylist =
        await WebServices().fetchDetailsByCountry(country);

    this.countries =
        countrylist.map((detail) => CountryViewModel(country: detail)).toList();

    if (this.countries.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }

  // void listenToMapType(String mapType) {

  //   this.mapType=MapType.normal;
  // }
}
