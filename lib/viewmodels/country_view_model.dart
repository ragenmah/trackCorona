import 'package:trackcorona/models/country.dart';

class CountryViewModel {
  Country _country;
  CountryViewModel({Country country}) : _country = country;

  String get name {
    return _country.name;
  }

  String get capital {
    return _country.capital;
  }

  List<dynamic> get latitudelng {
    return _country.latlng;
  }

  String get region {
    return _country.region;
  }

  String get subregion {
    return _country.subregion;
  }

  int get population {
    return _country.population;
  }

  String get nativeName {
    return _country.nativeName;
  }

  String get countryflag {
    return _country.flag;
  }
}
