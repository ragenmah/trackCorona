class Country {
  final String name;
  final String capital;
  final String region;
  final String subregion;
  final int population;
  // final Map<String, String> latlng;
  final List<dynamic> latlng;
  final String nativeName;
  final String flag;

  Country(
      {this.name,
      this.capital,
      this.region,
      this.subregion,
      this.population,
      this.latlng,
      this.nativeName,
      this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["name"],
      capital: json["capital"],
      region: json['region'],
      subregion: json['subregion'],
      population: json['population'],
      latlng: json['latlng'],
      nativeName: json['nativeName'],
      flag: json['flag'],
    );
  }
}
