// ignore: depend_on_referenced_packages
import 'package:weather_new/api_key.dart'; // the api key is used from this path
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_new/components/geolocator.dart';



double? locationTemp;
double? locationMinTemp;
double? locationMaxTemp;
int? weatherLogo;


// this function is created to manage the api call and other methods and features related to the api ONLY for [[SearchBarWidget.dart]]
Future <Map<dynamic , dynamic>> weatherApiCall(String searchedLocation) async {
  // this url is for fetching the location based on user search and is being implemented in the [[SearchBarWidget.dart]]
  final url = Uri.parse(
    'https://api.openweathermap.org/data/2.5/weather?q=$searchedLocation&units=metric&appid=$apiKeyNew',
  );

  final apiResponse = await http.get(url);

  if (apiResponse.statusCode == 200) {
    final data = jsonDecode(apiResponse.body);

    // print("$data");

    String Region = data['name'] ?? 'NOT FOUND';
    String Country = data['sys']['country'] ?? 'NOT FOUND';
    double locationTemp = data['main']['temp'] ?? 0.0;
    String Stat = data['weather'][0]['description'] ?? 'NOT FOUND';

    print("STATE : $Region \n");
    print("COUNTRY : $Country \n");

    print("TEMPERATURE : $locationTemp \n");
    print("STATUS : $Stat \n");
 
    return{
      'locationTemp': locationTemp,
      'region': Region,
      'country' : Country,
      'stat' : Stat,
    };
  }
   else {
    print('STATUS CODE: ${apiResponse.statusCode}');
    print('RESPONSE BODY: ${apiResponse.body}');
    throw Exception('Failed to fetch weather data');
  }
}





// ill make a new function within the geolocator.dart which will return the coordinates and then use a new url and fetch the current location of that 

// lats and longs being fetched 
Future<Map<dynamic , dynamic>>  currentLocationTemp() async{
  GeolocatorFetchingLocation userCoordinates = GeolocatorFetchingLocation();

  await userCoordinates.fetchingUserLocation();

  double latitude = userCoordinates.latitude_return; 
  double longitude = userCoordinates.longitude_return;

  print("LATI>>>>>> $latitude\n");
  print("LONGI>>>>> $longitude");

  
  // using the current weather url to keep updating the weather realtime [the main temp displayed]
  final currentWeatherUrl = Uri.parse(
    'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKeyNew&units=metric' ,
  );  

  // using the current weather url to show that the weather will be in the present day [today 10 - 20] (same url)
  final forcastWeatherUrl = Uri.parse(
    'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKeyNew&units=metric',
  );

  final currentWeatherApiResponse = await http.get(currentWeatherUrl);
  final forcastWeatherApiResponse = await http.get(forcastWeatherUrl);

  double locationTemp = 0;
 
  // this condition will check if api works and then fetch the data needed or produce the exception for the main temp and the logo code
  if(currentWeatherApiResponse.statusCode == 200){
    final data = jsonDecode(currentWeatherApiResponse.body);

    locationTemp = (data['main']['temp'] as num?)?.toDouble() ?? 0.0;
    weatherLogo = (data['weather']?[0]['id']) ?? 0;
    
    print("TEMPERATURE NEW API ::: $locationTemp");
    print("WEATHER CODE NEW API ::: $weatherLogo");
    
    
  } 
  else{
    print('Failed to fetch data: ${currentWeatherApiResponse.statusCode}');
  }

  // this condition will check if api works and then fetch the data needed or produce the exception for the todays temp
  if(forcastWeatherApiResponse.statusCode == 200){
    final data = jsonDecode(forcastWeatherApiResponse.body);

    locationMinTemp = (data['main']['temp_min'])?.toDouble() ?? 0.0;
    locationMaxTemp = (data['main']['temp_max'])?.toDouble() ?? 0.0;
    print("MIN TEMP ::: $locationMinTemp");
    print("MAX TEMP ::: $locationMaxTemp");
  }
  else{
    print('Failed to fetch data: ${currentWeatherApiResponse.statusCode}');
  }

  return {
    'locationTemp' : locationTemp,
    'locationMinTemp' : locationMinTemp,
    'locationMaxTemp' : locationMaxTemp,
    'weatherLogo' : weatherLogo,
  };
}