import 'package:plotemay_technical_task/src/data/provider/weather_provider.dart';
import 'package:weather/weather.dart';

Future<Weather> getWeather(String cityName) async {
  return await fetchWeather(cityName);
}
