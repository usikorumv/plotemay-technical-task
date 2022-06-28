part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherError extends WeatherState {}

class LocationError extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final String weather;

  const WeatherLoaded({required this.weather});

  @override
  List<Object> get props => [weather];
}
