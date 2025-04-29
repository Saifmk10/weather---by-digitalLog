// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_new/statefull_widgets/api_logic.dart';
import 'package:weather_new/stateless_widgets/SearchBarWidget.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationWidget createState() => _LocationWidget();
}

class _LocationWidget extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.0),
      child: Align(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 0, 0),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SvgPicture.asset(
                  "assets/location_on.svg",
                  height: 60,
                  width: 60,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CV RAMAN NAGAR",
                    style: GoogleFonts.jura(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  Text(
                    "BENGALURU",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.jura(
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
