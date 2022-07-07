import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
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


          dynamic error = jsonDecode(_parseJsonFromText(e.toString()));
          String errorMessage = error["message"];

          emit(LocationLoadError(errorMessage: errorMessage));

          return;
        }

        Weather weather = await getWeather(cityName);

        double celcius = _roundTo(weather.temperature!.celsius!.toDouble(), 2);
        double farenheit =
            _roundTo(weather.temperature!.fahrenheit!.toDouble(), 2);

        String formattedWeather =
            "Weather for $countryName,\n$cityName: $celcius°C ($farenheit°F)";

        emit(WeatherLoaded(weather: formattedWeather));
      } catch (e, s) {
        log(e.toString());
        log(s.toString());

        dynamic error = jsonDecode(_parseJsonFromText(e.toString()));
        String errorMessage = error["message"];

        emit(WeatherLoadError(errorMessage: errorMessage));
      }
    });
  }
}

double _roundTo(double num, int toPoint) {
  return double.parse((num).toStringAsFixed(toPoint));
}

String _parseJsonFromText(String text) {
  String jsonPart = RegExp(r"{(.*?)\}").stringMatch(text)!;
  return jsonPart;
}
