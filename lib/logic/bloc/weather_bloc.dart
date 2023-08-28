import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/networks/model/current_weather_model.dart';
import 'package:weatherapp/networks/model/day_weather_model.dart';
import 'package:weatherapp/networks/model/hour_weather_model.dart';
import 'package:weatherapp/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState()) {
    on<LoadWeatherEvent>(_loadWeather);
  }


    final weatherRepository = WeatherRepository(); 

    FutureOr<void> _loadWeather(WeatherEvent event,Emitter<WeatherState> emit) async {
      emit(state.copyWith(isLoading: true));
      try{
        
        LocationPermission permission;
        await Geolocator.isLocationServiceEnabled();
        Position? position;
        permission = await Geolocator.checkPermission();

        if(permission == LocationPermission.denied){
          permission = await Geolocator.requestPermission();
          if(permission == LocationPermission.denied){
            Future.error("Permission Denied");
          }
          position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);  
        }

        double lat=position!.latitude;
        double lon= position.longitude;

        final dayWeatherResult = await weatherRepository.getDayWeather(lat,lon);
        final currentWeatherResult = await weatherRepository.getCurrentWeather(lat,lon);
        final hourWeatherResult = await weatherRepository.getHourWeather(lat,lon);

        emit(state.copyWith(dayWeatherModel: dayWeatherResult,currentWeatherModel: currentWeatherResult,hourWeatherModel: hourWeatherResult));
      }catch(ex){
        emit(state.copyWith(error: ex.toString()));
      }finally{
        emit(state.copyWith(isLoading: false));
      }
    }
  }
