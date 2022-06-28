import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plotemay_technical_task/src/application.dart';
import 'package:plotemay_technical_task/src/logic/utils/observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const Application()),
    blocObserver: SimpleObserver(),
  );
}
