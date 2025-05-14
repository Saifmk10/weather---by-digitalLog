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
    'https://api.weatherbit.io/v2.0/current?key=$apiKey&city=$searchedLocation',
  );

  final apiResponse = await http.get(url);

  if (apiResponse.statusCode == 200) {
    final data = jsonDecode(apiResponse.body);

    // print("$data");

    String Region = data['data']?[0]['state_name'] ?? 'NOT FOUND';
    String Country = data['data']?[0]['country_code'] ?? 'NOT FOUND';
    double locationTemp = data['data']?[0]['temp'] ?? 0.0;
    String Stat = data['data']?[0]['weather']?['description'] ?? 'NOT FOUND';

    print("STATE : $Region \n");
    print("COUNTRY : $Country \n");

    print("TEMPERATURE : $locationTemp \n");
    print("STATUS : $Stat \n");
    // print(data);
 
    return{
      'locationTemp': locationTemp,
      'region': Region,
      'country' : Country,
      'stat' : Stat,
    };
  }
   else {
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

  

  final url = Uri.parse(
    'https://api.weatherbit.io/v2.0/forecast/daily?lat=$latitude&lon=$longitude&key=$apiKey',
  );  

  final apiResponse = await http.get(url);
  double locationTemp = 0;

  if(apiResponse.statusCode == 200){
    final data = jsonDecode(apiResponse.body);

    locationTemp = (data['data']?[0]['temp'] as num?)?.toDouble() ?? 0.0;
    locationMinTemp = (data['data']?[0]['min_temp'])?.toDouble() ?? 0.0;
    locationMaxTemp = (data['data']?[0]['max_temp'])?.toDouble() ?? 0.0;
    weatherLogo = (data['data']?[0]['weather']?['code'])?.toInt() ?? 0;
    
    print("MIN TEMP ::: $locationMinTemp");
    print("MAX TEMP ::: $locationMaxTemp");
  } 
  else{
    print('Failed to fetch data: ${apiResponse.statusCode}');
  }

  return {
    'locationTemp' : locationTemp,
    'locationMinTemp' : locationMinTemp,
    'locationMaxTemp' : locationMaxTemp,
    'weatherLogo' : weatherLogo,
  };
}