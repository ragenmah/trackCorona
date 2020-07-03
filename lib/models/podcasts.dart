class Podcasts {
  final String title;
  final String source;
  final String audioUrl;
  final String imageUrl;
  // final int population;

  final String summary;

  Podcasts(
      {this.title,
      this.source,
      this.audioUrl,
      this.imageUrl,
      // this.population,
      this.summary});

  factory Podcasts.fromJson(Map<String, dynamic> json) {
    return Podcasts(
      title: json["title"],
      source: json["source"],
      audioUrl: json["audio_url"],
      imageUrl: json["image_url"],
      summary: json["summary"],
    );
  }
}
