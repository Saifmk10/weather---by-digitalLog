import 'package:flutter/material.dart';
import 'statefull_widgets/SearchBarWidget.dart';
import 'statefull_widgets/LocationWidget.dart';
import 'statefull_widgets/TemperatureWidget.dart';
import 'statefull_widgets/CommentsPassed.dart';
// import 'statefull_widgets/TodaysWeatherWidget.dart';
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
                // search bar 
                SearchBarWidget(),
                SizedBox(height: 10),

                // location widget [contains the location being fetched from geolocator]
                LocationWidget(),
                SizedBox(height: 0),

                // temperature widget [contains the current weather and todays weather]
                TemperatureWidget(),
                SizedBox(height: 0),

                // comments passed weather
                CommentsPassed(),
                SizedBox(height: 0),

                // COMING SOON

                // todays weather widget
                // TodaysWeatherWidget(), 
                // SizedBox(height: 0),

                
                MoreDetailsWidget(),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
