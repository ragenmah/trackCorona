import 'package:dio/dio.dart';
import 'package:trackcorona/models/corona.dart';
import 'package:trackcorona/models/country.dart';
import 'package:trackcorona/models/hospital.dart';
import 'package:trackcorona/models/podcasts.dart';
import 'package:trackcorona/utils/constants.dart';

class WebServices {
  var dio = new Dio();

  Future<List<Country>> fetchDetailsByCountry(String country) async {
    final response = await dio.get(Constants.detailsOf(country));

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      print(list);
      return list.map((detail) => Country.fromJson(detail)).toList();
    } else {
      throw Exception("Failed To get country details");
    }
  }

  Future<List<Country>> fetchAllCountries() async {
    String url = Constants.COUNTRY_API_URL;

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      print(list);
      return list.map((detail) => Country.fromJson(detail)).toList();
    } else {
      throw Exception("Failed to get country details");
    }
  }

  Future<List<Hospital>> fetchAllHospitals() async {
    String url = Constants.HOSPITAL_API_URL;

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result["data"];
      print(list);
      return list.map((detail) => Hospital.fromJson(detail)).toList();
    } else {
      throw Exception("Failed to get Hospital details");
    }
  }

  Future<List<Corona>> fetchAllCoronaWorldDetails() async {
    String url = Constants.CORONA_WORLD_API_URL;

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      print(list);
      return list.map((detail) => Corona.fromJson(detail)).toList();
    } else {
      throw Exception("Failed to get Hospital details");
    }
  }

  Future<List<Podcasts>> fetchAllPodcasts() async {
    String url = Constants.PODCASTS_API_URL;

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result["data"];
      print(list);
      return list.map((detail) => Podcasts.fromJson(detail)).toList();
    } else {
      throw Exception("Failed to get Hospital details");
    }
  }
}
