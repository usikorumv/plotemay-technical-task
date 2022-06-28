import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plotemay_technical_task/src/logic/blocs/counter/counter_bloc.dart';
import 'package:plotemay_technical_task/src/logic/blocs/weather/weather_bloc.dart';
import 'package:plotemay_technical_task/src/ui/screens/home/components/shrink_in_and_out_fab.dart';
import 'package:plotemay_technical_task/src/utils/my_theme/config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int count = BlocProvider.of<CounterBloc>(context).count;

    bool shrinkIncreaseButton =
        BlocProvider.of<CounterBloc>(context).state is CounterIncreaseBlocked;
    bool shrinkDecreaseButton =
        BlocProvider.of<CounterBloc>(context).state is CounterDecreaseBlocked;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Counter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is WeatherLoaded) {
                  return Text(state.weather);
                }
                if (state is WeatherError) {
                  return const Text("Something went wrong!");
                }
                return const Text("Press the icon to get your location");
              },
            ),
            const SizedBox(height: 40),
            const Text(
              "You have pushed the button this many times:",
            ),
            Text(
              "$count",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    currentTheme.switchTheme();
                  },
                  child: const Icon(Icons.palette),
                ),
                const SizedBox(height: 15),
                FloatingActionButton(
                  onPressed: () {
                    _getWeather("San Francisco");
                  },
                  child: const Icon(Icons.cloud),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShrinkInAndOutFAB(
                  onPressed: _increase,
                  shrink: shrinkIncreaseButton,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 15),
                ShrinkInAndOutFAB(
                  onPressed: _decrease,
                  shrink: shrinkDecreaseButton,
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _increase() {
    BlocProvider.of<CounterBloc>(context).add(IncreaseCounter());
    setState(() {});
  }

  void _decrease() {
    BlocProvider.of<CounterBloc>(context).add(DecreaseCounter());
    setState(() {});
  }

  void _getWeather(String cityName) {
    BlocProvider.of<WeatherBloc>(context).add(LoadWeather(cityName: cityName));
    setState(() {});
  }
}
