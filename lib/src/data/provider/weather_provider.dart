import 'package:weather/weather.dart';

String apiKey = "YOUR-API-KEY"; // https://openweathermap.org/api

WeatherFactory weatherFactory = WeatherFactory(apiKey);

Future<Weather> fetchWeather(String cityName) async {
  Weather weather = await weatherFactory.currentWeatherByCityName(cityName);
  return weather;
}
