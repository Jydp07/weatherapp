class CurrentWeatherModel {
  List<Weather>? weather;
  Main? main;
  Wind? wind;
  String? name;

  CurrentWeatherModel({
    this.weather,
    this.main,
    this.wind,
    this.name,
  });

  CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    name = json['name'];
  }
}


class Weather {
  String? main;
  String? description;

  Weather({this.main, this.description,});

  Weather.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    description = json['description'];
  }
}

class Main {
  dynamic temp;
  dynamic pressure;
  dynamic humidity;
  Main(
      {this.temp,
      this.pressure,
      this.humidity,});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
}

class Wind {
  dynamic speed;

  Wind({this.speed,});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
  }
}



