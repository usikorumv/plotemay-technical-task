import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plotemay_technical_task/src/data/repository/geolocation_repository.dart';
import 'package:plotemay_technical_task/src/data/repository/weather_repository.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<LoadWeather>((event, emit) async {
      emit(WeatherLoading());

      try {
        String countryName, cityName;

        try {
          countryName = await getCountryName();
          cityName = await getCityName();
        } catch (e, s) {
          log(e.toString());
          log(s.toString());

          emit(LocationError());
          return;
        }

        Weather weather = await getWeather(cityName);

        double celcius = _(weather.temperature!.celsius!.toDouble());
        double farenheit = _(weather.temperature!.fahrenheit!.toDouble());

        String formattedWeather =
            "Weather for $countryName,\n$cityName: $celcius°C ($farenheit°F)";

        emit(WeatherLoaded(weather: formattedWeather));
      } catch (e, s) {
        log(e.toString());
        log(s.toString());

        emit(WeatherError());
      }
    });
  }
}

double _(double num) {
  return double.parse((num).toStringAsFixed(2));
}
