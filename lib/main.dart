import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_exam_project/screens/home_screen.dart';

void main() => runApp(const ProviderScope(
      child: Weather(),
    ));

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flexify(
        designHeight: 812,
        designWidth: 375,
        app: MaterialApp(title: 'Weather App', home: HomeScreen()));
  }
}
