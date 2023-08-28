class EndPoint{
  dayWeatherUrl(double lat,double lon,){
    return "https://pro.openweathermap.org/data/2.5/forecast/climate?lat=$lat&lon=$lon&appid=cf273608dbd9ebc9b2d12d2cfe8037e6&units=metric&cnt=7";
  }

  currentWeatherUrl(double lat,double lon){
    return "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=cf273608dbd9ebc9b2d12d2cfe8037e6&units=metric";
  }

  hourWeatherUrl(double lat,double lon,){
    return "https://pro.openweathermap.org/data/2.5/forecast/hourly?lat=$lat&lon=$lon&appid=cf273608dbd9ebc9b2d12d2cfe8037e6&units=metric&cnt=24";
  }
}