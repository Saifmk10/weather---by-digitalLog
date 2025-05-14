// ignore: file_names
// ignore_for_file: unused_import, depend_on_referenced_packages
import 'dart:ffi';

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
  int? tempLogo;

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
    int tempLogoFetched = UserCurrentLocatioMap['weatherLogo'];

    setState(() {
      temp = tempFetched;
      tempMin = tempMinFetched;
      tempMax = tempMaxFetched;
      tempLogo = tempLogoFetched;

      print("TEMPERATURE FETCHED : $temp");
      print("MIN TEMPERATURE FETCHED : $tempMin");
      print("MAX TEMPERATURE FETCHED : $tempMax");
      print("WEATHER CODE FETCHED : $tempLogo");
    });
  }



// this function is used to check the weather code provided by the api from the tempLogo variable 
  String returningWeatherLogo(){
    List <String> pathsArray = ['assets/weatherLogo/200-232.svg' ,
                           'assets/weatherLogo/233.svg',
                           'assets/weatherLogo/300-302.svg',
                           'assets/weatherLogo/500.svg',
                           'assets/weatherLogo/501-502.svg',
                           'assets/weatherLogo/511-522.svg',
                           'assets/weatherLogo/600-602_621-623.svg', 
                           'assets/weatherLogo/611-612.svg',
                           'assets/weatherLogo/700_741-751.svg',
                           'assets/weatherLogo/711.svg',
                           'assets/weatherLogo/800.svg',
                           'assets/weatherLogo/801.svg',
                           'assets/weatherLogo/802.svg',
                           'assets/weatherLogo/803-804.svg'
                           ];

    
    switch(tempLogo){
      case 200 : case 201 : case 202 : case 230 : case 231 : case 232 :
      return pathsArray[0];

      case 233 :
      return pathsArray[1];

      case 300 : case 301 : case 302 :
      return pathsArray[2];

      case 500 : 
      return pathsArray[3];

      case 501 : case 502 : 
      return pathsArray[4];

      case 511 : case 520 : case 521 : case 522 :
      return pathsArray[5];

      case 600 : case 602 : case 621 : case 622 : case 623 : 
      return pathsArray[6];

      case 611 : case 612 :
      return pathsArray[7];

      case 700 : case 741 : case 751 :
      return pathsArray[8];

      case 711:
      return pathsArray[9];

      case 800:
      return pathsArray[10];

      case 801:
      return pathsArray[11];

      case 802:
      return pathsArray[12];

      case 803: case 804:
      return pathsArray[13]; 


      default:
      return 'Some error in function returningWeatherLogo() or no logo fetched';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, bottom: 10),
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
                      // in this we are calling the function directly to get the path of the image asper the weather code provided
                      Flexible(
                        child: Padding(padding: EdgeInsets.fromLTRB(6,0,0,100), child:SvgPicture.asset(returningWeatherLogo() , width: 120,)) 
                      )
                       
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
