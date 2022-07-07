part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CounterInitial extends CounterState {}

class CounterIncreaseBlocked extends CounterState {}

class CounterDecreaseBlocked extends CounterState {}
