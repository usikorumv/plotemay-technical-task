import 'package:weather/weather.dart';

String apiKey = "2d323f7aec69df6f156b7611ec6689f7";

WeatherFactory weatherFactory = WeatherFactory(apiKey);

Future<Weather> fetchWeather(String cityName) async {
  Weather weather = await weatherFactory.currentWeatherByCityName(cityName);
  return weather;
}
