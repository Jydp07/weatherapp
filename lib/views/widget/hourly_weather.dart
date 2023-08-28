import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({super.key, required this.hourWeather});
  final dynamic hourWeather;
  @override
  Widget build(BuildContext context) {
    return Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Hourly Forecast",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: 24,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final dateTime =
                                        hourWeather.list[index].dtTxt;
                                    var time = dateTime!.substring(10, 16);
                                    final format = DateFormat.Md();
                                    final dayChange =
                                        format.format(DateTime.now().add(const Duration(days: 1)));
                                    final weatherSituation = hourWeather
                                        ?.list?[index].weather?[0].main;
                                    final temprature =
                                        (hourWeather?.list?[index].main?.temp)
                                            .round();
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "$temprature°",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            if (weatherSituation == "Clouds")
                                              Image.asset(
                                                  'assets/images/cloud.png',
                                                  height: 35,
                                                  width: 35),
                                            if (weatherSituation == "Rain")
                                              Image.asset(
                                                'assets/images/rain.png',
                                                height: 35,
                                                width: 35,
                                              ),
                                            if (weatherSituation == "Clear")
                                              Image.asset(
                                                'assets/images/clear_sky.png',
                                                height: 35,
                                                width: 35,
                                              ),
                                            if (weatherSituation == "Sunny")
                                              Image.asset(
                                                  'assets/images/sun.png',
                                                  height: 35,
                                                  width: 35),
                                            Text(
                                              time == " 00:00"
                                                  ? dayChange
                                                  : time,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        );
  }
}