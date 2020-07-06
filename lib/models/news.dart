class NEWS {
  final String url; //source url
  final String title;
  final String source;
  final String summary;
  final String imageUrl;

  NEWS({
    this.url,
    this.title,
    this.source,
    this.summary,
    this.imageUrl,
  });
  factory NEWS.fromJson(Map<String, dynamic> json) {
    return NEWS(
      url: json["url"],
      title: json["title"],
      source: json["source"],
      summary: json["summary"],
      imageUrl: json["image_url"],
    );
  }
}
