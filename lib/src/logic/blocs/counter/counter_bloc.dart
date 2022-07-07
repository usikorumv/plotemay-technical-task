import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final int multiplier;
  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  final int min = 0, max = 10;

  CounterBloc({this.multiplier = 1}) : super(CounterDecreaseBlocked()) {
    on<IncreaseCounter>((event, emit) {
      if ((counter.value += 1 * multiplier) >= max) {
        counter.value = max;
        emit(CounterIncreaseBlocked());
      } else {
        emit(CounterInitial());
      }
    });

    on<DecreaseCounter>((event, emit) {
      if ((counter.value -= 1 * multiplier) <= min) {
        counter.value = min;
        emit(CounterDecreaseBlocked());
      } else {
        emit(CounterInitial());
      }
    });
  }
}
