import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_new/components/api_logic.dart';

class TodaysWeatherWidget extends StatefulWidget {
  const TodaysWeatherWidget({super.key});

  @override
  _TodaysWeatherWidget createState() => _TodaysWeatherWidget();
}

class _TodaysWeatherWidget extends State<TodaysWeatherWidget> {

  // List<String> timeList = [];
  // List<double> temperatureAtTimeList = [];
  // List<int> weatherLogoAtTimeList = [];

  // @override
  // void initState(){
  //   super.initState();
  //   fetching24hTemp();
  // }

  //   void fetching24hTemp() async {
  //   try {
  //     Map<dynamic, dynamic> fetchedTemps = await currentLocationTemp();

  //     // Safely convert dynamic data to typed lists
  //     List<String> fetchedTime = List<String>.from(fetchedTemps['time'] ?? []);
  //     List<double> fetchedTemperatureAtTime =
  //         List<double>.from(fetchedTemps['temperatureAtTime'] ?? []);
  //     List<int> fetchedWeatherLogoAtTime =
  //         List<int>.from(fetchedTemps['weatherLogoAtTime'] ?? []);

  //     setState(() {
  //       timeList = fetchedTime;
  //       temperatureAtTimeList = fetchedTemperatureAtTime;
  //       weatherLogoAtTimeList = fetchedWeatherLogoAtTime;

  //       print("TIME FETCHED ::::: ${timeList[0]}\n");
  //       print("TEMPERATURE FETCHED AT TIME :::: $temperatureAtTimeList\n");
  //       print("WEATHER LOGO FETCHED AT TIME :::: $weatherLogoAtTimeList\n");
  //     });
  //   } catch (e) {
  //     print("ERROR fetching weather data: $e");
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          width: 350,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0x00000000),
            border: Border.all(color: Color(0xFF000000), width: 2),
            borderRadius: BorderRadius.circular(40),
          ),

          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            child: Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 15, 0, 0),

                child: Column(
                  children: [
                    // this container will hold the 3 items , text icon text
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            "NOW",
                            style: TextStyle(
                              fontFamily: 'Michroma',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              height: 0.1,
                            ),
                          ),

                          SizedBox(height: 10),

                          SvgPicture.asset(
                            'assets/weatherLogo/600-602_621-623.svg',
                            height: 40,
                          ),

                          SizedBox(height: 12),

                          Text(
                            "21",
                            style: TextStyle(
                              fontFamily: 'Michroma',
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              height: 0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 20),

              // new timing
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),

                child: Column(
                  children: [
                    // this container will hold the 3 items , text icon text
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            "4:30pm",
                            style: TextStyle(
                              fontFamily: 'Michroma',
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              height: 0.1,
                            ),
                          ),

                          SizedBox(height: 10),

                          SvgPicture.asset(
                            'assets/weatherLogo/600-602_621-623.svg',
                            height: 40,
                          ),

                          SizedBox(height: 12),

                          Text(
                            "22",
                            style: TextStyle(
                              fontFamily: 'Michroma',
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              height: 0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 20),

              // new timing
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),

                child: Column(
                  children: [
                    // this container will hold the 3 items , text icon text
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            "4:30pm",
                            style: TextStyle(
                              fontFamily: 'Michroma',
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              height: 0.1,
                            ),
                          ),

                          SizedBox(height: 10),

                          SvgPicture.asset(
                            'assets/weatherLogo/600-602_621-623.svg',
                            height: 40,
                          ),

                          SizedBox(height: 12),

                          Text(
                            "22",
                            style: TextStyle(
                              fontFamily: 'Michroma',
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              height: 0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 20),

              // new timing
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),

                child: Column(
                  children: [
                    // this container will hold the 3 items , text icon text
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            "4:30pm",
                            style: TextStyle(
                              fontFamily: 'Michroma',
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              height: 0.1,
                            ),
                          ),

                          SizedBox(height: 10),

                          SvgPicture.asset(
                            'assets/weatherLogo/600-602_621-623.svg',
                            height: 40,
                          ),

                          SizedBox(height: 12),

                          Text(
                            "22",
                            style: TextStyle(
                              fontFamily: 'Michroma',
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              height: 0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 20),

              // new timing
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),

                child: Column(
                  children: [
                    // this container will hold the 3 items , text icon text
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            "4:30pm",
                            style: TextStyle(
                              fontFamily: 'Michroma',
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              height: 0.1,
                            ),
                          ),

                          SizedBox(height: 10),

                          SvgPicture.asset(
                            'assets/weatherLogo/600-602_621-623.svg',
                            height: 40,
                          ),

                          SizedBox(height: 12),

                          Text(
                            "22",
                            style: TextStyle(
                              fontFamily: 'Michroma',
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              height: 0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              

            ],
          ),
          ),

          
        ),
      ),
    );
  }
}
