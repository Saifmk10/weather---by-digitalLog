// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'statefull_widgets/SearchBarWidget.dart';
import 'statefull_widgets/LocationWidget.dart';
import 'statefull_widgets/TemperatureWidget.dart';
import 'statefull_widgets/CommentsPassed.dart';
import 'statefull_widgets/TodaysWeatherWidget.dart';
import 'statefull_widgets/MoreDetailsWidget.dart';
import 'components/geolocator.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  Key refreshKey = UniqueKey();

  // Declare an instance of GeolocatorFetchingData
  late GeolocatorFetchingLocation geolocatorFetchingData;

  @override
  void initState() {
    super.initState();
    geolocatorFetchingData = GeolocatorFetchingLocation();
    requestLocationPermission(); // Request permission when the app starts
  }

  // Function to request location permission and fetch coordinates
  Future<void> requestLocationPermission() async {
    try {
      await geolocatorFetchingData.fetchingUserLocation();
      debugPrint("LOCATION PERMISSION GRANTED...");
    } catch (e) {
      debugPrint("Error: $e");
      // Handle permission denial or errors here (could show an alert to the user)
    }
  }


  Future<void> _handleRefresh() async {
    debugPrint("Pull-to-refresh triggered");

    try {
      setState(() {
        refreshKey = UniqueKey();
      });
      debugPrint("Data refreshed successfully.");
    } catch (e) {
      debugPrint("Error during refresh: $e");
    }
  }

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      key: refreshKey ,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFCCCCCC),
        body: SafeArea(
  child: RefreshIndicator(
    onRefresh: _handleRefresh,
    child: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(), // this makes sure it can always pull even if content is small
      child: Column(
        children: [
          SearchBarWidget(),
          SizedBox(height: 10),


          LocationWidget(),
          SizedBox(height: 0),


          TemperatureWidget(),
          SizedBox(height: 0),


          CommentsPassed(),
          SizedBox(height: 0),


          MoreDetailsWidget(),

          SizedBox(
            child: Text('Developed by SaifMK'),
          )
        ],
      ),
    ),
  ),
),

      ),
    );
  }
}
