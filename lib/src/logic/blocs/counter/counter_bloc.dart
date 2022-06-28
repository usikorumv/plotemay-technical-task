import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plotemay_technical_task/src/utils/my_theme/config.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int count = 0, multiplier = 1;

  CounterBloc() : super(CounterDecreaseBlocked()) {
    currentTheme.addListener(() {
      multiplier = currentTheme.currentTheme() == ThemeMode.light ? 1 : 2;
    });

    on<IncreaseCounter>((event, emit) {
      count += 1 * multiplier;

      if (count >= 10) {
        count = 10;

        emit(CounterIncreaseBlocked());
        return;
      }

      emit(CounterInitial());
    });

    on<DecreaseCounter>((event, emit) {
      count -= 1 * multiplier;

      if (count <= 0) {
        count = 0;

        emit(CounterDecreaseBlocked());
        return;
      }

      emit(CounterInitial());
    });
  }
}
