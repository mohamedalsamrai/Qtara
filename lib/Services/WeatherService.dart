// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:news/models/WeatherModel.dart';

class Weatherservice {
  final dio = Dio();

  Weatherservice();

  // دالة لجلب بيانات الطقس للأيام
  Future<List<WeatherModel>> getTempAtDays({required String nameCity}) async {
    try {
      Response response = await dio.get(
          "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$nameCity?key=AS6LXASH6UDZNT5E3SSETNGZ2");
      Map<dynamic, dynamic> jsonData = response.data;

      List<dynamic> days = jsonData["days"];
      List<WeatherModel> weatherData = [];

      for (var day in days) {
        WeatherModel weatherModel = WeatherModel.fromJson(day);

        weatherData.add(weatherModel);
      }

      return weatherData;
    } catch (e) {
      return [];
    }
  }
}
