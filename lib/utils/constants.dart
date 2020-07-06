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

  static const String FAQS_API_URL = "https://nepalcorona.info/api/v1/faqs";

  static const String MYTHS_API_URL = "https://nepalcorona.info/api/v1/myths";
  // static const String NEWS_API_URL = "https://nepalcorona.info/api/v1/news";
  static const String NEWS_API_URL =
      "https://nepalcorona.info/api/v1/news?limit=20";

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
  {
    'assets/corona_images/preventions/Prevent 1_0.png':
        '1. Avoid close contact with anyone with a cold or flu-like symptoms, and if you have a fever or are coughing yourself please keep a distance from others or make sure to use a mask. '
  },
  {
    'assets/corona_images/preventions/Prevent 2.png':
        '2. Avoid crowds and recommend others to the same. Instead of shaking hands, do a namaste instead.'
  },
  {
    'assets/corona_images/preventions/Prevent 3.png':
        '3. Clean hands frequently and thoroughly with soap and water, or alcohol-based hand sanitizer'
  },
  {
    'assets/corona_images/preventions/Prevent 4_0.png':
        '4. Cover nose and mouth when coughing or sneezing with tissue or a flexed elbow. Once you have used a tissue, please make sure to dispose of it properly in a covered waste bin, and remember to wash your hands thoroughly for a minimum of 20 seconds with soap and water or using an alcohol-based hand sanitizer.'
  },
  {
    'assets/corona_images/preventions/Prevent 5.png':
        '5. If you have returned from overseas, please make sure to stay home for 14 days, maintaining a distance from family members as well. If you see any of the symptoms described above, please contact a health facility immediately.'
  },
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
