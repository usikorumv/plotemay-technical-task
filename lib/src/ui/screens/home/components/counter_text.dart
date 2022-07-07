import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plotemay_technical_task/src/logic/blocs/counter/counter_bloc.dart';

class CounterText extends StatefulWidget {
  const CounterText({Key? key}) : super(key: key);

  @override
  State<CounterText> createState() => _CounterTextState();
}

class _CounterTextState extends State<CounterText> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> counter = context.read<CounterBloc>().counter;

    return Column(
      children: [
        const Text(
          "You have pushed the button this many times:",
        ),
        ValueListenableBuilder<int>(
          valueListenable: counter,
          builder: (BuildContext context, int value, Widget? child) => Text(
            "${counter.value}",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    );
  }
}
