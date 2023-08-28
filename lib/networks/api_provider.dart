import 'package:dio/dio.dart';
import 'package:weatherapp/networks/endpoint.dart';
import 'package:weatherapp/networks/model/current_weather_model.dart';
import 'package:weatherapp/networks/model/day_weather_model.dart';

import 'model/hour_weather_model.dart';

class ApiProvider{
  final _dio = Dio();
  final endpoint = EndPoint();
  Future<DayWeatherModel> getDayWeatherData(double lat,double lon) async {
    final dayWeatherResponse = await _dio.get(endpoint.dayWeatherUrl(lat,lon));
    return DayWeatherModel.fromJson(dayWeatherResponse.data);
  }

  Future<CurrentWeatherModel> getCurrentWeatherData(double lat,double lon) async {
    final currentWeatherResponse = await _dio.get(endpoint.currentWeatherUrl(lat, lon));
    return CurrentWeatherModel.fromJson(currentWeatherResponse.data);
  }

  Future<HourWeatherModel> getHourWeatherData(double lat,double lon) async {
    final hourWeatherResponse = await _dio.get(endpoint.hourWeatherUrl(lat, lon));
    return HourWeatherModel.fromJson(hourWeatherResponse.data);
  }
}