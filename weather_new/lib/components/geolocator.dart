import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GeolocatorFetchingData {

  String localArea = '';
  String city = '';


  Future<void> fetchingUserLocation() async {
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
        return Future.error("Location permission denied");
      }
    }

    // if the user denies the request then this message will the popped.
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission denied forever..");
    }



    // if permission is granded then this will be returned
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print(
      "CO-ORDINATES FETCHED: LATITUDE = ${position.latitude}, LONGITUDE = ${position.longitude}"
    );

    // this Placemaker is a datatype that is provided in the geocoding package
    // placemarkFromCoordinate() takes in the arguments of the coordinates and helps in fetching the location name as a string
    List<Placemark> decodedLocation = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    Placemark userLocationInWords = decodedLocation[0];

    localArea = userLocationInWords.subLocality ?? '';
    city = userLocationInWords.locality ?? '';

    print(
      "LOCATION FETCHED: LOCAL AREA = $localArea, CITY = $city"
    );

  }
}
