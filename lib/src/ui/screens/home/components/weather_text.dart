import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plotemay_technical_task/src/logic/blocs/weather/weather_bloc.dart';

class WeatherText extends StatefulWidget {
  const WeatherText({Key? key}) : super(key: key);

  @override
  State<WeatherText> createState() => _WeatherTextState();
}

class _WeatherTextState extends State<WeatherText> {
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const CircularProgressIndicator();
        }
        if (state is WeatherLoaded) {
          return Text(state.weather);
        }
        if (state is WeatherError) {
          return const Text("Getting weather went wrong");
        }
        if (state is LocationError) {
          return const Text("Getting current location went wrong");
        }
        return const Text("Press the icon to get your location");
      },
    );
  }
}
