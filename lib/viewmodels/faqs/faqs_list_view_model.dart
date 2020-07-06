import 'package:flutter/material.dart';
import 'package:trackcorona/models/faqs.dart';
import 'package:trackcorona/services/web_services.dart';
import 'package:trackcorona/viewmodels/faqs/faqs_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class FAQSListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<FAQSViewModel> faqs = new List<FAQSViewModel>();
  // MapType mapType = MapType.normal;

  void allFAQS() async {
    List<FAQS> faqslist = await WebServices().fetchAllFAQS();
    notifyListeners();

    this.faqs = faqslist.map((detail) => FAQSViewModel(faqs: detail)).toList();
    if (this.faqs.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
