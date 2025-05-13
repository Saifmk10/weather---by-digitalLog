import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:weather_new/components/api_logic.dart';
import 'package:weather_new/components/geolocator.dart';

class TemperatureWidget extends StatefulWidget {
  const TemperatureWidget({super.key});

  @override
  _TemperatureWidget createState() => _TemperatureWidget();
}

class _TemperatureWidget extends State<TemperatureWidget> {
  double? temp;
  double? tempMin;
  double? tempMax;

  @override
  void initState() {
    super.initState();
    loadCoordinates();
  }

  void loadCoordinates() async {
    Map<dynamic, dynamic> UserCurrentLocatioMap = await currentLocationTemp();

    double tempFetched = UserCurrentLocatioMap['locationTemp'];
    double tempMinFetched = UserCurrentLocatioMap['locationMinTemp'];
    double tempMaxFetched = UserCurrentLocatioMap['locationMaxTemp'];

    setState(() {
      temp = tempFetched;
      tempMin = tempMinFetched;
      tempMax = tempMaxFetched;

      print("TEMPERATURE FETCHED : $temp");
      print("MIN TEMPERATURE FETCHED : $tempMin");
      print("MAX TEMPERATURE FETCHED : $tempMax");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40, bottom: 10),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              
              // in this stack is the main container , inside which all the elements are kept , for the main temp and the weather logo
              // ive used the row to make them come in the same line and for the responsiveness to work as the temp changes
              child: Stack(
                children: [
                  Row(
                    children: [
                      SingleChildScrollView(
                        
                      ),
                      Column(
                        children: [
                          Text(
                            temp != null ? "${temp!.toInt()}" : "--",
                            // "3",
                            style: TextStyle(
                              fontFamily: 'Jura',
                              fontSize: 200,
                              fontWeight: FontWeight.w400,
                              height: 0.8,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false,
                            ),
                          ),
                        ],
                      ),

                      Padding(padding: EdgeInsets.fromLTRB(6,0,0,100), child:SvgPicture.asset("assets/weather-sun.svg")) 
                    ],
                  ),


                  Positioned(
                    bottom: 10,
                    left: 13,
                    child: Text(
                      tempMin != null && tempMax != null?
                      "Today ${tempMin!.toInt()}° - ${tempMax!.toInt()}°":"loading...",
                      style: TextStyle(
                        fontFamily: 'Jura',
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
