class Corona {
  final String country;
  final int totalCases;
  final int newCases;
  final int totalDeaths;
  final int newDeaths;
  final int activeCases;
  final int totalRecovered;
  final int criticalCases;
  final String continent;

  final Map<String, dynamic> countryInfo;

  Corona(
      {this.country,
      this.totalCases,
      this.newCases,
      this.totalDeaths,
      this.newDeaths,
      this.activeCases,
      this.totalRecovered,
      this.criticalCases,
      this.continent,
      this.countryInfo});

  factory Corona.fromJson(Map<String, dynamic> json) {
    return Corona(
        country: json["country"],
        totalCases: json["totalCases"],
        newCases: json["newCases"],
        totalDeaths: json["totalDeaths"],
        newDeaths: json["newDeaths"],
        activeCases: json["activeCases"],
        totalRecovered: json["totalRecovered"],
        criticalCases: json["criticalCases"],
        continent: json["continent"],
        countryInfo: json["countryInfo"]);
  }
}
