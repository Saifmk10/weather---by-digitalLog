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
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),

      child: Column(
        children: [
          // this holds the first 3 sets of boxes
          Row(
            children: [
              Container(
                height: 100,
                width: 100,

                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),

                decoration: BoxDecoration(
                  // color: Color(0xFFEC1E1E),
                  border: Border.all(color: Color(0xFF060606), width: 2.5),

                  borderRadius: BorderRadius.circular(20),
                ),

                // this child is holing the image of the logo
                child: Align(
                  alignment: Alignment.topLeft,

                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: SvgPicture.asset(
                      "assets/appLogo/sun_uvIndex.svg",
                      width: 40,
                      height: 40,
                    ),
                  ),

                  
                ),

                
              ),

              Container(
                height: 100,
                width: 100,
                color: Color.fromARGB(255, 236, 30, 30),
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              ),

              Container(
                height: 100,
                width: 100,
                color: Color.fromARGB(255, 236, 30, 30),
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              ),
            ],
          ),

          Row(children: [
              
            ],
          ),
        ],
      ),
    );
  }
}
