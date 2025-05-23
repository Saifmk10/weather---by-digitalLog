// ignore: file_names
// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_new/components/api_logic.dart';
import 'package:weather_new/components/geolocator.dart';
import 'package:weather_new/stateless_widgets/SearchBarWidget.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationWidget createState() => _LocationWidget();
}

class _LocationWidget extends State<LocationWidget> {


  String localArea = '';
  String city = '';

  GeolocatorFetchingLocation locationFetcher = GeolocatorFetchingLocation();
  @override
  void initState(){
    super.initState();

    locationFetcher.fetchingUserLocation().then((_) {
    setState(() {
      localArea = locationFetcher.localArea;
      city = locationFetcher.city;
    });
  });
  }

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.0),
      child: Align(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 30, 0, 0),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SvgPicture.asset(
                  "assets/appLogo/location_on.svg",
                  height: 60,
                  width: 60,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // this is the variable that is being used for the location
                    // the var is getting the location from the funnction call happening from line 23 onwards
                    localArea.isEmpty ? 'Loading...' : localArea,
                    style: TextStyle(
                      fontFamily: 'Jura',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  Text(
                    // this is the variable that is being used for the location
                    // the var is getting the location from the funnction call happening from line 23 onwards
                    city.isEmpty ? 'Loading...' : city.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Jura',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
