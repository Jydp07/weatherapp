part of 'weather_bloc.dart';


// ignore: must_be_immutable
class WeatherState extends Equatable{
  bool isLoading;
  String? error;
  DayWeatherModel? dayWeatherModel;
  CurrentWeatherModel? currentWeatherModel;
  HourWeatherModel? hourWeatherModel;
  WeatherState({this.isLoading = false,this.error,this.dayWeatherModel,this.currentWeatherModel,this.hourWeatherModel});

  WeatherState copyWith({
    bool? isLoading,
    String? error,
    DayWeatherModel? dayWeatherModel,
    CurrentWeatherModel? currentWeatherModel,
    HourWeatherModel? hourWeatherModel,
  }){
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      dayWeatherModel: dayWeatherModel ?? this.dayWeatherModel,
      currentWeatherModel: currentWeatherModel ?? this.currentWeatherModel, 
      hourWeatherModel: hourWeatherModel ?? this.hourWeatherModel
    );
  }
  
  @override
  List<Object?> get props => [isLoading,error,dayWeatherModel,currentWeatherModel,hourWeatherModel];
}