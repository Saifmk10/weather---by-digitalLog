import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_new/components/api_logic.dart';
// import 'package:';

class CommentsPassed extends StatefulWidget {
  const CommentsPassed({super.key});

  @override
  _CommentsPassed createState() => _CommentsPassed();
}

class _CommentsPassed extends State<CommentsPassed> {
  String? quote;

  @override
  void initState() {
    super.initState();
    renderingQuote();
  }

  void renderingQuote() async {
    String fetchedQuote = await returningQuotes();
    setState(() {
      quote = fetchedQuote;
    });
  }

  // this function is fetching the logo code from the api so that it can be used to get the quotes accordingly
  Future<int?> fetchingLogoCode() async {
    Map<dynamic, dynamic> UserCurrentLocatioMap = await currentLocationTemp();
    int? tempCode = UserCurrentLocatioMap['weatherLogo'];
    print("LOGO CODE ==::== $tempCode");
    return tempCode;
  }

  // this function is responsible for the storing and managing of which quotes needs to be returned when
  Future<String> returningQuotes() async {
    List<String> sunnyQuote = [
      "Suns out, so are the vibes. Go soak it in",
      "Shades on, smiles wide, let’s ride the sunshine",
      "No clouds, no worries — just sunshine and smiles",
      "Soak up the sun, it’s nature’s happy pill",
    ];

    List<String> rainyQuote = [
      "Let the rain wash your worries away",
      "Drizzles and daydreams — perfect combo",
      "A little rain never hurt a cozy soul",
      "Mood: puddles, playlists, and peace",
    ];

    List<String> cloudyQuote = [
      "Grey skies, but the vibe’s still high",
      "Grey skies whisper peace — a moment to just be",
      "Not gloomy, just moody — a sky full of thoughts",
      "Clouds above, calm within — peace floats through the gray",
    ];

    List<String> stormyQuote = [
      "Chaos in the clouds, but calm in your heart.",
      "Let the storm rage, you’re the eye of it.",
      "Power in the sky, peace on the ground.",
      "Lightning may flash, but you still shine.",
    ];

    List<String> snowyQuote = [
      "Chill in the air, magic everywhere.",
      "Snowflakes and slow days — let it drift.",
      "Frosty outside, toasty inside.",
      "Blankets of white, memories in the making.",
    ];

    // List<String> foggyQuote = [
    //   "Lost in the mist, found in the moment.",
    //   "Soft steps and foggy thoughts.",
    //   "The world’s on pause — breathe it in.",
    //   "Hazy view, clear mind.",
    // ];

    // List<String> windyQuote = [
    //   "Winds may blow, but you stay grounded.",
    //   "Let it sweep you into something new.",
    //   "Hair’s a mess, but the energy’s fresh.",
    //   "Catch the breeze, chase your dreams.",
    // ];

    int? code = await fetchingLogoCode();

    int random = Random().nextInt(4);

    switch (code) {
      // stromy day quotes
      case 200:
      case 201:
      case 202:
      case 210:
      case 211:
      case 212:
      case 221:
      case 230:
      case 231:
      case 232:
      case 233:
        return stormyQuote[random];

      // rain day quotes
      case 300:
      case 301:
      case 302:
      case 500:
      case 501:
      case 502:
      case 511:
      case 512:
      case 520:
      case 521:
      case 522:
        return rainyQuote[random];

      // snow day quotes
      case 600:
      case 601:
      case 602:
      case 611:
      case 612:
      case 621:
      case 622:
      case 623:
        return snowyQuote[random];

      // clear sky
      case 800:
      case 801:
        return sunnyQuote[random];

      // cloudy
      case 802:
      case 803:
      case 804:
        return cloudyQuote[random];

      default:
        return "Hope your having a greate day";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 30, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300, // or whatever height you want
            child: SingleChildScrollView(
              child: Text(
                "$quote",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Michroma',
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
