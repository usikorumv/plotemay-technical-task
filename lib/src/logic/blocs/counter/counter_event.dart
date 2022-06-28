part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class IncreaseCounter extends CounterEvent {}

class DecreaseCounter extends CounterEvent {}
