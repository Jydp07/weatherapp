class DayWeatherModel {
  City? city;
  List<ListElement>? list;


  DayWeatherModel({this.city, this.list});

  DayWeatherModel.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    if (json['list'] != null) {
      list = <ListElement>[];
      json['list'].forEach((v) {
        list!.add(ListElement.fromJson(v));
      });
    }
  }
}

class City {
  String? name;

  City(
      {
      this.name,});

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}

class ListElement {
  List<Weather>? weather;
  Temp? temp;

  ListElement(
      {
      this.temp,
      this.weather,});

  ListElement.fromJson(Map<String, dynamic> json) {
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
  }
}

class Temp {
  dynamic day;

  Temp({this.day,});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    return data;
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
