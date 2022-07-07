import 'package:flutter/material.dart';
import 'package:plotemay_technical_task/src/ui/screens/home/components/counter_text.dart';
import 'package:plotemay_technical_task/src/ui/screens/home/components/fabs.dart';
import 'package:plotemay_technical_task/src/ui/screens/home/components/weather_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Counter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: WeatherText(),
            ),
            SizedBox(height: 40),
            CounterText(),
          ],
        ),
      ),
      floatingActionButton: const FABs(),
    );
  }
}
