import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/networks/model/day_weather_model.dart';

class SevenDaysWeather extends StatelessWidget {
  const SevenDaysWeather({super.key, required this.weather});
  final DayWeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    var dayFormat = DateFormat.E();
    var monthDateFormat = DateFormat.MMMd();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seven Days Weather"),
        backgroundColor: const Color.fromARGB(255, 31, 39, 153),
      ),
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: ((context, index) {
            final weatherSituation = weather?.list?[index].weather?[0].main;
            String day =
                dayFormat.format(DateTime.now().add(Duration(days: index)));
            String date = monthDateFormat
                .format(DateTime.now().add(Duration(days: index)));

            int temprature = (weather?.list?[index].temp?.day).round();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 56, 64, 176),
                  Color.fromARGB(255, 31, 39, 153),
                  Color.fromARGB(255, 9, 15, 103)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(14)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$temprature°',
                                  style: const TextStyle(
                                      fontSize: 50, color: Colors.white,fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 35,
                              ),
                              Text(
                                day,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                date,
                                style: const TextStyle(fontSize: 16,color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            if (weatherSituation == "Clouds")
                            Image.asset('assets/images/cloud.png',
                                height: 140, width: 140),
                          if (weatherSituation == "Rain")
                            Image.asset(
                              'assets/images/rain.png',
                              height: 140,
                              width: 140,
                            ),
                          if (weatherSituation == "Clear")
                            Image.asset(
                              'assets/images/clear_sky.png',
                              height: 140,
                              width: 140,
                            ),
                        
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${weather?.list?[index].weather?[0].description}',style: const TextStyle(fontSize: 16,color: Colors.white)),
                          )
                          ],),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
