// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_new/components/api_logic.dart';

class SearchBarWidget extends StatelessWidget {
  // making a callback function that will return the name of the location searched
  // final Function(String) returningSearchedLocation;

  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Align(
        child: Padding(
          padding: EdgeInsets.only(top: 1.0),

          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 300,

              child: TextField(
                // the api is being called here
                onSubmitted: (String searchedLocation) {
                  print("USER TYPED: $searchedLocation");
                  weatherApiCall(searchedLocation);
                  // returningSearchedLocation(searchedLocation);
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
                  prefixIconConstraints: BoxConstraints(minWidth: 100),
                  labelText: "Search City",
                  labelStyle: GoogleFonts.jura(
                    color: Color(0xFFCCCCCC),
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 0, 0, 0),

                  // this doesnt make any big differance
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

                  // this padding is used to move the text within the search bar
                  contentPadding: EdgeInsets.only(left: 50),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  
}
