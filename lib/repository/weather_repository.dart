import 'package:weatherapp/networks/api_provider.dart';
import 'package:weatherapp/networks/model/current_weather_model.dart';
import 'package:weatherapp/networks/model/day_weather_model.dart';

import '../networks/model/hour_weather_model.dart';

class WeatherRepository {
  final _apiProvider = ApiProvider();

  Future<DayWeatherModel> getDayWeather(double lat, double lon) {
    return _apiProvider.getDayWeatherData(lat, lon);
  }

  Future<CurrentWeatherModel> getCurrentWeather(double lat, double lon){
    return _apiProvider.getCurrentWeatherData(lat, lon);
  }

  Future<HourWeatherModel> getHourWeather(double lat, double lon,){
    return _apiProvider.getHourWeatherData(lat, lon);
  }
}
