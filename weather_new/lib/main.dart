import 'package:flutter/material.dart';
import 'stateless_widgets/SearchBarWidget.dart';
import 'statefull_widgets/LocationWidget.dart';
import 'statefull_widgets/TemperatureWidget.dart';
import 'statefull_widgets/CommentsPassed.dart';
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
      print("LOCATION PERMISSION GRANTED...");
    } catch (e) {
      print("Error: $e");
      // Handle permission denial or errors here (could show an alert to the user)
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFCCCCCC),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SearchBarWidget(returningSearchedLocation: (String) {}),
                SearchBarWidget(),
                SizedBox(height: 10),

                LocationWidget(),
                SizedBox(height: 0),

                TemperatureWidget(),
                SizedBox(height: 0),

                CommentsPassed(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
