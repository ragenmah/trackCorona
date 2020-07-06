// import 'package:trackcorona/models/country.dart';
import 'package:trackcorona/models/myths.dart';

class MythsViewModel {
  Myths _myths;
  MythsViewModel({Myths myths}) : _myths = myths;

  String get myth {
    return _myths.myth;
  }

  String get mythNP {
    return _myths.mythNP;
  }

  String get reality {
    return _myths.reality;
  }

  String get realityNP {
    return _myths.realityNP;
  }

  String get imageUrl {
    return _myths.imageUrl;
  }

  String get sourceName {
    return _myths.sourceName;
  }
}
