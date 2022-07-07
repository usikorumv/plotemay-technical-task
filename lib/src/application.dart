import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plotemay_technical_task/src/logic/blocs/counter/counter_bloc.dart';
import 'package:plotemay_technical_task/src/logic/blocs/weather/weather_bloc.dart';
import 'package:plotemay_technical_task/src/ui/screens/home/home_screen.dart';
import 'package:plotemay_technical_task/src/utils/my_theme/config.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();

    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ptolemay Technical Task',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(
              multiplier:
                  currentTheme.currentTheme() == ThemeMode.light ? 1 : 2,
            ),
          ),
          BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
