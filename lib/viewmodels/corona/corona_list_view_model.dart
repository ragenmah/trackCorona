import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
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
  List<SmartSelectOption<String>> options = [];
  void allCoronaDetails() async {
    List<Corona> coronalist = await WebServices().fetchAllCoronaWorldDetails();
    notifyListeners();

    this.coronaDetails =
        coronalist.map((detail) => CoronaViewModel(corona: detail)).toList();
    addCountryInList(coronaDetails);
    if (this.coronaDetails.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  addCountryInList(List clvm) {
    clvm.asMap().forEach((i, value) {
      // print(
      //     'index=$i, value=${corona[i].countryName}, death=${corona[i].criticalCases}');
      // if (corona[i].countryName == this.widget.countryName)
      // setState(() {
      //   index = i;
      //   return;
      // });
      // setState(() {
      options.remove(clvm[i].countryName);
      if (clvm[i].countryName != "" && clvm[i].countryName != "World")
        options.add(SmartSelectOption<String>(
            value: clvm[i].countryName, title: clvm[i].countryName));
      // );
      // return;
      // });
    });
  }
}
