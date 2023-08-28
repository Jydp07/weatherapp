class HourWeatherModel {
  List<ListElement>? list;

  HourWeatherModel({
    this.list,
  });

  HourWeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ListElement>[];
      json['list'].forEach((v) {
        list!.add(ListElement.fromJson(v));
      });
    }
  }
}

class ListElement {
  Main? main;
  List<Weather>? weather;
  String? dtTxt;

  ListElement({
    this.main,
    this.weather,
    this.dtTxt,
  });

  ListElement.fromJson(Map<String, dynamic> json) {
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    dtTxt = json['dt_txt'];
  }
}

class Main {
  dynamic temp;

  Main({this.temp});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
  }
}

class Weather {
  String? main;

  Weather({ this.main,});

  Weather.fromJson(Map<String, dynamic> json) {
    main = json['main'];
  }
}

class Wind {
  dynamic speed;

  Wind({this.speed,});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
  }
}
