// ignore_for_file: unused_import, depend_on_referenced_packages


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:weather_new/components/api_logic.dart';
import 'package:weather_new/components/geolocator.dart';

import 'package:weather_new/statefull_widgets/SearchBarWidget.dart';

class TemperatureWidget extends StatefulWidget {
  const TemperatureWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
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

    // this is a event listener that is going to check if the checker is set to true or false , if flase then itll show temp for 
    //user location and if true it will show the temp for user searched location
    checker.addListener((){
      // if(checker.value == false){
      //   loadCoordinatesTemp();
      // }
      // else{
      //   loadUserSearchedLocation();
      // }

       if(checker.value == true){
         loadUserSearchedLocation();
      }
      // else{
      //   loadCoordinatesTemp();
      // }
      
       
      
    
  
    });

    if(checker.value == false){
      loadCoordinatesTemp();
    }
    // else{
    //   loadUserSearchedLocation();
    // }

     if(Statuscode == 400){
        loadCoordinatesTemp();
      } // doesnt work for now
   


  }

  // this fucntion will load the temp of the user location
  void loadCoordinatesTemp() async {
    // ignore: non_constant_identifier_names
    Map<dynamic, dynamic> UserCurrentLocatioMap = await currentLocationTemp();

    double tempFetched = UserCurrentLocatioMap['locationTemp'] ?? 0.0;
    double tempMinFetched = UserCurrentLocatioMap['locationMinTemp'] ?? 0.0;
    double tempMaxFetched = UserCurrentLocatioMap['locationMaxTemp'] ?? 0.0;
    int tempLogoFetched = UserCurrentLocatioMap['weatherLogo'];

    setState(() {
      temp = tempFetched;
      tempMin = tempMinFetched;
      tempMax = tempMaxFetched;
      tempLogo = tempLogoFetched;

      debugPrint("FROM THE CO-ORDINATES");
      debugPrint("CHECKER IS SET TO : $checker");
      debugPrint("TEMPERATURE FETCHED : $temp");
      debugPrint("MIN TEMPERATURE FETCHED : $tempMin");
      debugPrint("MAX TEMPERATURE FETCHED : $tempMax");
      debugPrint("WEATHER CODE FETCHED : $tempLogo");
    });
  }

  // this will show the temp of the user searched location
  void loadUserSearchedLocation() async{
    
    Map<dynamic, dynamic>? userSearchedLocationWeatherMap = await userSearchedLocationWeather(searchedLocation);
    

    double searchedLocationtemp = userSearchedLocationWeatherMap['locationTemp'];
    int searchedLocationCode = userSearchedLocationWeatherMap['code'];

    setState(() {
      temp = searchedLocationtemp;
      tempLogo = searchedLocationCode;

      debugPrint("FROM THE SEARCHED LOCATION");
      debugPrint("TEMPERATURE FETCHED : $temp");
      debugPrint("MIN TEMPERATURE FETCHED : $tempMin");
      debugPrint("MAX TEMPERATURE FETCHED : $tempMax");
      debugPrint("WEATHER CODE FETCHED : $tempLogo");
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
                           'assets/weatherLogo/803-804.svg',
                           'assets/weatherLogo/smiley-default.svg'
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
      return pathsArray[14];
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25,  top: 1),
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
                      Column(
                        children: [
                          Text(
                            temp != null ? "${temp!.toInt()}" : "--",
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
                        child: Padding(padding: EdgeInsets.fromLTRB(3,0,0,100), child:SvgPicture.asset(returningWeatherLogo() , width: 120,)) 
                      )
                       
                    ],
                  ),


                  Positioned(
                    bottom: 10,
                    left: 13,
                    child: Text(
                      tempMin != null && tempMax != null?
                      "TODAY ${tempMin!.toInt()}° - ${tempMax!.toInt()}°":"loading...",
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