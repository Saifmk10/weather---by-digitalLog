// ignore: depend_on_referenced_packages
import 'package:weather_new/api_key.dart'; // the api key is used from this path
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_new/components/geolocator.dart';

double? locationTemp;
double? locationMinTemp;
double? locationMaxTemp;
int? weatherLogo;
int? Statuscode;










// this function is created to manage the api call and other methods and features related to the api ONLY for [[SearchBarWidget.dart]]
Future<Map<dynamic, dynamic>> userSearchedLocationWeather(
  String searchedLocation,
) async {
  // this url is for fetching the location based on user search and is being implemented in the [[SearchBarWidget.dart]]
  final url = Uri.parse(
    'https://api.openweathermap.org/data/2.5/weather?q=$searchedLocation&units=metric&appid=$apiKeyNew',
  );

  final apiResponse = await http.get(url);

  if (apiResponse.statusCode == 200) {
    final data = jsonDecode(apiResponse.body);

    String Region = data['name'] ?? 'NOT FOUND';
    String Country = data['sys']['country'] ?? 'NOT FOUND';
    double locationTemp = (data['main']['temp'] as num?)?.toDouble() ?? 0.0;
    int code = data['weather'][0]['id'] ?? 000;

    print("STATE : $Region \n");
    print("COUNTRY : $Country \n");

    print("TEMPERATURE : $locationTemp \n");
    print("STATUS : $code \n");

    return {
      'locationTemp': locationTemp,
      'region': Region,
      'country': Country,
      'code': code,
    };
  } else {
    print('STATUS CODE: ${apiResponse.statusCode}');
    print('RESPONSE BODY: ${apiResponse.body}');

    Statuscode = apiResponse.statusCode;
    throw Exception('Failed to fetch weather data');
  }
}










// this dunction will fetch the location of the user with the help of geo locator and geocoding.
Future<Map<dynamic, dynamic>> currentLocationTemp() async {
  GeolocatorFetchingLocation userCoordinates = GeolocatorFetchingLocation();

  await userCoordinates.fetchingUserLocation();

  double latitude = userCoordinates.latitude_return;
  double longitude = userCoordinates.longitude_return;

  print("LATI>>>>>> $latitude\n");
  print("LONGI>>>>> $longitude");

  // using the current weather url to keep updating the weather realtime [the main temp displayed]
  final currentWeatherUrl = Uri.parse(
    'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKeyNew&units=metric',
  );

  // using the current weather url to show that the weather will be in the present day [today 10 - 20] (same url)
  final forcastWeatherUrl = Uri.parse(
    // 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKeyNew&units=metric',
    'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKeyNew&units=metric',
  );

  final currentWeatherApiResponse = await http.get(currentWeatherUrl);
  final forcastWeatherApiResponse = await http.get(forcastWeatherUrl);

  double locationTemp = 0;

  // this condition will check if api works and then fetch the data needed or produce the exception for the main temp and the logo code
  if (currentWeatherApiResponse.statusCode == 200) {
    final data = jsonDecode(currentWeatherApiResponse.body);

    locationTemp = (data['main']['temp'] as num?)?.toDouble() ?? 0.0;
    weatherLogo = (data['weather']?[0]['id']) ?? 0;

    print("TEMPERATURE NEW API ::: $locationTemp");
    print("WEATHER CODE NEW API ::: $weatherLogo");
  } else {
    print('Failed to fetch data: ${currentWeatherApiResponse.statusCode}');
  }

  // this condition will check if api works and then fetch the data needed or produce the exception for the todays temp
  if (forcastWeatherApiResponse.statusCode == 200) {
    final data = jsonDecode(forcastWeatherApiResponse.body);
    final List<dynamic> forecastList = data['list'];

    double minTemp = double.infinity;
    double maxTemp = -double.infinity;

    DateTime today = DateTime.now();

    // idk how this one works but this is used to calculate the min and max temp using 5days forecast as the api is not paid version
    for (var item in forecastList) {
      DateTime dt = DateTime.parse(item['dt_txt']);
      if (dt.day == today.day &&
          dt.month == today.month &&
          dt.year == today.year) {
        double temp = (item['main']['temp'] as num).toDouble();
        if (temp < minTemp) minTemp = temp;
        if (temp > maxTemp) maxTemp = temp;
      }
    }

    // If no data found for today, fallback to 0
    locationMinTemp = (minTemp == double.infinity) ? 0.0 : minTemp;
    locationMaxTemp = (maxTemp == -double.infinity) ? 0.0 : maxTemp;

    print("MIN TEMP ::: $locationMinTemp");
    print("MAX TEMP ::: $locationMaxTemp");
    print(data);
  } else {
    print('Failed to fetch data: ${forcastWeatherApiResponse.statusCode}');
  }

  return {
    'locationTemp': locationTemp,
    'locationMinTemp': locationMinTemp,
    'locationMaxTemp': locationMaxTemp,
    'weatherLogo': weatherLogo,
  };
}
