import 'package:weather/weather.dart';

String apiKey = "2d323f7aec69df6f156b7611ec6689f7";

WeatherFactory wf = WeatherFactory(apiKey);

Future<Weather> fetchWeather(String cityName) async {
  Weather w = await wf.currentWeatherByCityName(cityName);
  return w;
}
