import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String location; // location name for the UI
  String? time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for API endpoint

  WorldTime({required this.location, this.time, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make the request
      http.Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // Create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property
      time = now.toString();
    } catch (e) {
      print('Caught error: $e');
      time = 'could not get time data';
    }
  }
}
