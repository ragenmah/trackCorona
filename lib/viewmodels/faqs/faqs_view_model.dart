// import 'package:trackcorona/models/country.dart';
import 'package:trackcorona/models/faqs.dart';

class FAQSViewModel {
  FAQS _faqs;
  FAQSViewModel({FAQS faqs}) : _faqs = faqs;

  String get question {
    return _faqs.question;
  }

  String get questionNP {
    return _faqs.questionNP;
  }

  String get answer {
    return _faqs.answer;
  }

  String get answerNP {
    return _faqs.answerNP;
  }

  String get category {
    return _faqs.category;
  }
}
