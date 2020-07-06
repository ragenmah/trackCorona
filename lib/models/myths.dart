class Myths {
  final String myth;
  final String mythNP;
  final String reality;
  final String realityNP;
  final String imageUrl;
  final String sourceName;

  Myths(
      {this.myth,
      this.mythNP,
      this.reality,
      this.realityNP,
      this.imageUrl,
      this.sourceName});

  factory Myths.fromJson(Map<String, dynamic> json) {
    return Myths(
      myth: json["myth"],
      mythNP: json["myth_np"],
      reality: json["reality"],
      realityNP: json["reality_np"],
      imageUrl: json["image_url"],
      sourceName: json["source_name"],
    );
  }
}
