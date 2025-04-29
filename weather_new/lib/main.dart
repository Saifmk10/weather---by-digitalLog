import 'package:flutter/material.dart';
import 'stateless_widgets/SearchBarWidget.dart';
import 'statefull_widgets/LocationWidget.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFCCCCCC),

        body: SafeArea(
          child: Column(
            children: [
              // SearchBarWidget(returningSearchedLocation: (String) {}),
              SearchBarWidget(),
              SizedBox(height: 30),

              LocationWidget(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
