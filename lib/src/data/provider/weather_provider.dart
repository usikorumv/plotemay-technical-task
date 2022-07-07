import 'package:weather/weather.dart';

// TODO: PASTE YOUR OWN API KEY FROM https://openweathermap.org/api
String apiKey = "YOUR-OWN-API-KEY";

WeatherFactory weatherFactory = WeatherFactory(apiKey);

Future<Weather> fetchWeather(String cityName) async {
  Weather weather = await weatherFactory.currentWeatherByCityName(cityName);
  return weather;
}
