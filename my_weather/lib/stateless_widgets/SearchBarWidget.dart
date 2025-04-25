import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCCCCC),
      body: Padding(
        padding: EdgeInsets.only(top: 40.0),

        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 300,

            child: TextField(
              onSubmitted: (String value) {
                print('User submited: $value');
              },

              // designign for how the things look when user types something within the field
              cursorColor: Color(0xFFCCCCCC),
              style: TextStyle(color: Color(0xFFCCCCCC)),

              decoration: InputDecoration(
                // prefixicon used to add the icon within the textfield widget itself
                prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 28),
                  child: SvgPicture.asset(
                    "assets/search_locations.svg",
                    width: 30,
                    height: 30,
                  ),
                ),

                // prefixiconcontraints used so that the labeltext will get its own space with the help of box constraints
                prefixIconConstraints: BoxConstraints(minWidth: 110),
                labelText: "Search City",
                labelStyle: TextStyle(color: Color(0xFFCCCCCC)),
                filled: true,
                fillColor: Color.fromARGB(255, 0, 0, 0),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                // this is used to make a border of black clr when i click on the search bar
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 10.0,
                  ),
                ),

                contentPadding: EdgeInsets.only(left: 50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
