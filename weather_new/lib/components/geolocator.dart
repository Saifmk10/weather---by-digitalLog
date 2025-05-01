import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorFetchingData {
  Future<Position> fecthingCo_ordinates() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    // checking if the permission is already accepted by default in the user application
    if (!serviceEnabled) {
      return Future.error('Location is not enabled');
    }

    // asking the user to give permission for location access
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Future.error("Location permission denied");
      }
    }

    // if the user denies the request then this message will the popped.
    if (permission == LocationPermission.deniedForever) {
      Future.error("Location permission denied forever..");
    }

    // if permission is granded then this will be returned
    Position userLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print(
      "LOCATION FETCHED: Latitude = ${userLocation.latitude}, Longitude = ${userLocation.longitude}",
    );

    return userLocation;
  }
}
