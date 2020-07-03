class Constants {
  static const String COUNTRY_API_URL = "https://restcountries.eu/rest/v2/all";

  static const String CORONA_API_URL = "https://api.covid19api.com/summary";
// https://brp.com.np/covid/country.php
  static String detailsOf(String country) {
    return 'https://restcountries.eu/rest/v2/name/$country?fullText=true';
  }

  static const String HOSPITAL_API_URL =
      "https://nepalcorona.info/api/v1/hospitals";

  static const String CORONA_WORLD_API_URL =
      "https://nepalcorona.info/api/v1/data/world";

  static const String PODCASTS_API_URL =
      "https://nepalcorona.info/api/v1/podcasts";

  static const Map<String, String> EnglishToNepali = {
    "NewConfirmed": "Naya Sankramit",
    "TotalConfirmed": "Naya Sankramit Sankhya",
    "NewDeaths": "Naya Mrityu",
    "TotalDeaths": "Mrityu hune jamma",
    "NewRecovered": "Naya "
  };

  static const List<String> mapType = [
    "satellite",
    "hybrid",
    "normal",
    "terrain",
  ];

  static const List<String> columnsOfTable = [
    "country",
    "totalCases",
    "newCases",
    "totalDeaths",
    "newDeaths",
    "activeCases",
    "totalRecovered",
    "criticalCases",
    "continent",
  ];
}

final prevention = [
  {'assets/corona_images/preventions/Prevent 1_0.png': 'Wear a facemask'},
  {'assets/corona_images/preventions/Prevent 2.png': 'Avoid close contact'},
  {'assets/corona_images/preventions/Prevent 3.png': 'Clean your hands often'},
  {'assets/corona_images/preventions/Prevent 4_0.png': 'Cover nose  and mouth'},
  {'assets/corona_images/preventions/Prevent 5.png': 'Visit  Doctors'},
];
final symptoms = [
  {
    'assets/corona_images/symptoms/Symptom 1_2.png':
        'High fever \nabove 100.4 °F'
  },
  {'assets/corona_images/symptoms/Symptom 2.png': 'Problem in \nBreathing'},
  {'assets/corona_images/symptoms/Symptom 3_1.png': 'Frequent \ncough'},
];
final coronaHomeScreenData = [
  {'assets/corona_images/nepalcorona/news.jpg': 'News'},
  {'assets/corona_images/nepalcorona/myths.jpg': 'Myths'},
  {'assets/corona_images/nepalcorona/faqs.jpg': 'FAQs'},
  {'assets/corona_images/nepalcorona/podcasts.png': 'Podcasts'},
];
final officialNumbers = [
  {
    'MoHP Nepal': '9851255839',
  },
  {
    'MoHP Nepal': '9851255837',
  },
  {'MoHP Nepal': '9851255834'}
];

final covidUSADailyNewCases = [12.17, 11.15, 10.02, 11.21, 13.83, 14.16, 14.30];
