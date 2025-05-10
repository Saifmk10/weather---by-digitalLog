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

@override
void initState() {
  super.initState();
  loadCoordinates(); // This runs on startup
}

// working
void loadCoordinates() async {
  double UserCurrentLocationTemp = await currentLocationTemp();
  print("user current location temp :: $UserCurrentLocationTemp");
  
  setState(() {
    temp = UserCurrentLocationTemp;
    print("TEMPERATURE FETCHED : $temp");
  });
}



  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: 40 , bottom: 10),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,

              child: Stack( 
                children: [
                  Positioned(
                    left: 220 ,
                    top: 20,
                    child: SvgPicture.asset("assets/weather-sun.svg"),
                  ),
                  

                  Column(
                    children: [
                      Text(
                        temp!= null ?  "${temp!.toInt()}" : "--",
                        // "31",
                        style: GoogleFonts.jura(
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


                  Positioned(
                    bottom: 10, 
                    left: 13,
                    child: Text("Today 18° - 28°"  , style: GoogleFonts.jura( fontSize: 25 , fontWeight: FontWeight.w400),)
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
