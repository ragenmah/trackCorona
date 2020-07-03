import 'package:trackcorona/models/podcasts.dart';

class PodcastsViewModel {
  Podcasts _podcasts;
  PodcastsViewModel({Podcasts podcasts}) : _podcasts = podcasts;

  String get title {
    return _podcasts.title;
  }

  String get source {
    return _podcasts.source;
  }

  String get audioUrl {
    return _podcasts.audioUrl;
  }

  String get imageUrl {
    return _podcasts.imageUrl;
  }

  String get summary {
    return _podcasts.summary;
  }
}
