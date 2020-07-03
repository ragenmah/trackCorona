import 'package:trackcorona/models/corona.dart';
// import 'package:trackcorona/models/country.dart';

class CoronaViewModel {
  Corona _corona;
  CoronaViewModel({Corona corona}) : _corona = corona;

  String get countryName {
    return _corona.country;
  }

  int get totalCases {
    return _corona.totalCases;
  }

  int get newCases {
    return _corona.newCases;
  }

  int get totalDeaths {
    return _corona.totalDeaths;
  }

  int get newDeaths {
    return _corona.newDeaths;
  }

  int get activeCases {
    return _corona.activeCases;
  }

  int get totalRecovered {
    return _corona.totalRecovered;
  }

  int get criticalCases {
    return _corona.criticalCases;
  }

  String get continent {
    return _corona.continent;
  }
}
