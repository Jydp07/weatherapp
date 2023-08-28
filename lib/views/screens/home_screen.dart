import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/views/screens/seven_days_weather.dart';
import '../../logic/bloc/weather_bloc.dart';
import '../widget/hourly_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc()..add(LoadWeatherEvent()),
      child: const _LoadWeather(),
    );
  }
}

class _LoadWeather extends StatelessWidget {
  const _LoadWeather();

  _exitApp() {
    exit(0);
  }

  _nextWeek(context, weather) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SevenDaysWeather(weather: weather)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(66, 27, 24, 24),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.error != null) {
            return AlertDialog(
              content: Text("${state.error} Please restart the App"),
              actions: [
                TextButton(onPressed: _exitApp, child: const Text("Exit"))
              ],
            );
          } else if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final dayWeather = state.dayWeatherModel;
            final currentWeather = state.currentWeatherModel;
            final hourWeather = state.hourWeatherModel;
            final dateFormat = DateFormat.MMMd().format(DateTime.now());
            final weatherSituation = currentWeather?.weather?[0].main;
            dynamic temprature = currentWeather?.main?.temp != null
                ? (currentWeather?.main?.temp).round()
                : currentWeather?.main?.temp;
            return SafeArea(
              child: Center(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 56, 64, 176),
                                Color.fromARGB(255, 31, 39, 153),
                                Color.fromARGB(255, 9, 15, 103)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      "Today",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Text(
                                  dateFormat,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    _nextWeek(context, dayWeather);
                                  },
                                  child: const Text(
                                    "Next Week",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Text(
                              '${dayWeather?.city?.name}',
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            if (weatherSituation == "Clouds")
                              Image.asset('assets/images/cloud.png',
                                  height: 120, width: 120),
                            if (weatherSituation == "Rain")
                              Image.asset(
                                'assets/images/rain.png',
                                height: 120,
                                width: 120,
                              ),
                            if (weatherSituation == "Clear")
                              Image.asset(
                                'assets/images/clear_sky.png',
                                height: 120,
                                width: 120,
                              ),
                            if (weatherSituation == "Sunny")
                              Image.asset('assets/images/sun.png',
                                  height: 120, width: 120),
                            Text(
                              '${currentWeather?.weather?[0].description}',
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              ' $temprature°',
                              style: const TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      "Wind",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${currentWeather?.wind?.speed}",
                                          style: const TextStyle(
                                              fontSize: 26,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 4.0),
                                          child: Text(
                                            "Km",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      " Humidity",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${currentWeather?.main?.humidity}",
                                          style: const TextStyle(
                                            fontSize: 26,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 4.0),
                                          child: Text(
                                            "%",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "Pressure",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "${currentWeather?.main?.pressure}",
                                      style: const TextStyle(
                                          fontSize: 26,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 56, 64, 176),
                                  Color.fromARGB(255, 31, 39, 153),
                                  Color.fromARGB(255, 9, 15, 103)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(20)),
                        child: HourlyWeather(hourWeather: hourWeather),
                      ),
                    ),
                  )
                ]),
              ),
            );
          }
        },
      ),
    );
  }
}
