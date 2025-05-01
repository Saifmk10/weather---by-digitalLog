// ignore: depend_on_referenced_packages
import 'dart:convert';
import 'package:http/http.dart' as http;

final String apiKey = "9b9d6312471a40a4aa7144514252004";

// this function is created to manage the api call and other methods and features related to the api
void weatherApiCall(String searchedLocation) async {
  // final encodedSearchedLocation = Uri.encodeComponent(searchedLocation);
  final url = Uri.parse(
    'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$searchedLocation',
  );

  final apiResponse = await http.get(url);

  if (apiResponse.statusCode == 200) {
    final data = jsonDecode(apiResponse.body);

    String Region = data['location']?['region'] ?? 'NOT FOUND';
    String Country = data['location']?['country'] ?? 'NOT FOUND';
    double Temp = data['current']?['temp_c'] ?? 'NOT FOUND';
    String Stat = data['current']?['condition']?['text'] ?? 'NOT FOUND';

    print("STATE : $Region \n");
    print("COUNTRY : $Country \n");

    print("TEMPERATURE : $Temp \n");
    print("STATUS : $Stat \n");
    // print(data);
  }
}
