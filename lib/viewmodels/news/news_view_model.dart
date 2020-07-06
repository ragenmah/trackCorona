// import 'package:trackcorona/models/country.dart';
import 'package:trackcorona/models/news.dart';

class NewsViewModel {
  NEWS _news;
  NewsViewModel({NEWS news}) : _news = news;

  String get sourceUrl {
    return _news.url;
  }

  String get title {
    return _news.title;
  }

  String get sourceName {
    return _news.source;
  }

  String get summary {
    return _news.summary;
  }

  String get imageUrl {
    return _news.imageUrl;
  }
}
