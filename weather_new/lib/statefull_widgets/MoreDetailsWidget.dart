import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreDetailsWidget extends StatefulWidget {
  const MoreDetailsWidget({super.key});

  @override
  _MoreDetailsWidget createState() => _MoreDetailsWidget();
}

class _MoreDetailsWidget extends State<MoreDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 0, 30),
      
      // this is the main parent column that will be holding all the 6 widgets within it 
      child: Column( 
        children: [

          // this holds the first 2 sets of boxes  
          Row(
            children: [

              // this container will hold the UV INDEX DETAILS
              Container(
                height: 110,
                width: 110,

                margin: EdgeInsets.fromLTRB(14, 0, 0, 0),

                decoration: BoxDecoration(
                  // color: Color(0xFFEC1E1E),
                  border: Border.all(color: Color(0xFF060606), width: 2),

                  borderRadius: BorderRadius.circular(20),
                ),

                // this child is holding the image of the logo and even the text
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),

                  child: Column(
                    children: [

                      Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset(
                          "assets/appLogo/sun_uvIndex.svg",
                          width: 40,
                          height: 40,
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("UV" , style: TextStyle(fontFamily: 'Jura', fontWeight: FontWeight.w800, fontSize: 18),),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("9 strong" , style: TextStyle(fontFamily: 'Jura', fontWeight: FontWeight.w900, fontSize: 18 ),),
                      )
                    ],
                  ),
                ),
              ),



              // this container will hold the FEELS LIKE DETAILS 
              Container(
                height: 110,
                width: 110,

                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),

                decoration: BoxDecoration(
                  // color: Color(0xFFEC1E1E),
                  border: Border.all(color: Color(0xFF060606), width: 2),

                  borderRadius: BorderRadius.circular(20), 
                ),

                // this child is holding the image of the logo and even the text
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),

                  child: Column(
                    children: [

                      Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset(
                          "assets/appLogo/temperature_feelsLike.svg",
                          width: 40,
                          height: 43,
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Feels like" , style: TextStyle(fontFamily: 'Jura', fontWeight: FontWeight.w800, fontSize: 18),),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("29°c" , style: TextStyle(fontFamily: 'Jura', fontWeight: FontWeight.w900, fontSize: 18 ),),
                      )
                    ],
                  ),
                ),
              ),
              
            ],
          ),


          // this row will hold the humidity and the wind speed stuff
          Row(children: [

              Container(
                height: 110,
                width: 110,

                margin: EdgeInsets.fromLTRB(14, 20, 0, 0),

                decoration: BoxDecoration(
                  // color: Color(0xFFEC1E1E),
                  border: Border.all(color: Color(0xFF060606), width: 2),

                  borderRadius: BorderRadius.circular(20),
                ),

                // this child is holding the image of the logo and even the text
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),

                  child: Column(
                    children: [

                      Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset(
                          "assets/appLogo/humidity_drop.svg",
                          width: 40,
                          height: 40,
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Humidity" , style: TextStyle(fontFamily: 'Jura', fontWeight: FontWeight.w800, fontSize: 18),),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("81%" , style: TextStyle(fontFamily: 'Jura', fontWeight: FontWeight.w900, fontSize: 18 ),),
                      )
                    ],
                  ),
                ),
              ),



              Container(
                height: 110,
                width: 110,

                margin: EdgeInsets.fromLTRB(25, 20, 0, 0),

                decoration: BoxDecoration(
                  // color: Color(0xFFEC1E1E),
                  border: Border.all(color: Color(0xFF060606), width: 2),

                  borderRadius: BorderRadius.circular(20),
                ),

                // this child is holding the image of the logo and even the text
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),

                  child: Column(
                    children: [

                      Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset(
                          "assets/appLogo/wind_direction.svg",
                          width: 40,
                          height: 40,
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("WIND WD" , style: TextStyle(fontFamily: 'Jura', fontWeight: FontWeight.w800, fontSize: 18),),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("180°" , style: TextStyle(fontFamily: 'Jura', fontWeight: FontWeight.w900, fontSize: 18 ),),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),


          Row(children: [

              Container(
                height: 110,
                width: 110,

                margin: EdgeInsets.fromLTRB(15, 20, 0, 0),

                decoration: BoxDecoration(
                  // color: Color(0xFFEC1E1E),
                  border: Border.all(color: Color(0xFF060606), width: 2),

                  borderRadius: BorderRadius.circular(20),
                ),

                // this child is holding the image of the logo and even the text
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),

                  child: Column(
                    children: [

                      Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset(
                          "assets/appLogo/wind-speed.svg",
                          width: 40,
                          height: 40,
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("WIND WS" , style: TextStyle(fontFamily: 'Jura', fontWeight: FontWeight.w800, fontSize: 18),),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("20 m/s" , style: TextStyle(fontFamily: 'Jura', fontWeight: FontWeight.w900, fontSize: 18 ),),
                      )
                    ],
                  ),
                ),
              ),



              Container(
                height: 110,
                width: 110,

                margin: EdgeInsets.fromLTRB(25, 20, 0, 0),

                decoration: BoxDecoration(
                  // color: Color(0xFFEC1E1E),
                  border: Border.all(color: Color(0xFF060606), width: 2),

                  borderRadius: BorderRadius.circular(20),
                ),

                // this child is holding the image of the logo and even the text
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),

                  child: Column(
                    children: [

                      Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset(
                          "assets/appLogo/visibility_eye.svg",
                          width: 40,
                          height: 40,
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Visibility" , style: TextStyle(fontFamily: 'Jura', fontWeight: FontWeight.w800, fontSize: 18),),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("16km" , style: TextStyle(fontFamily: 'Jura', fontWeight: FontWeight.w900, fontSize: 18 ),),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
