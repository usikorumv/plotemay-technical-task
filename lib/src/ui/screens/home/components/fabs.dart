import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plotemay_technical_task/src/logic/blocs/counter/counter_bloc.dart';
import 'package:plotemay_technical_task/src/logic/blocs/weather/weather_bloc.dart';
import 'package:plotemay_technical_task/src/ui/screens/components/shrink_in_and_out_fab.dart';
import 'package:plotemay_technical_task/src/utils/my_theme/config.dart';

class FABs extends StatefulWidget {
  const FABs({Key? key}) : super(key: key);

  @override
  State<FABs> createState() => _FABsState();
}

class _FABsState extends State<FABs> {
  @override
  Widget build(BuildContext context) {
    bool shrinkIncreaseButton =
        BlocProvider.of<CounterBloc>(context).state is CounterIncreaseBlocked;
    bool shrinkDecreaseButton =
        BlocProvider.of<CounterBloc>(context).state is CounterDecreaseBlocked;

    return Padding(
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
                  _getWeather();
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

  void _getWeather() {
    BlocProvider.of<WeatherBloc>(context).add(LoadWeather());
    setState(() {});
  }
}
