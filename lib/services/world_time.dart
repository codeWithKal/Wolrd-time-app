import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime
{
  late String location;
  late String time;
  late String flag;
  late String url;
  bool isDay = false;

  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getdata() async
  {
    try {
      var uri = Uri.parse("http://worldtimeapi.org/api/timezone/$url");
      Response response = await get(uri);
      Map data = jsonDecode(response.body);


      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDay = now.hour > 6 && now.hour < 20 ? true: false;
      time = DateFormat.jm().format(now);

    }
    catch (e)
    {
      print("error has occured...! and the error is $e");
      time = "could not get time";
    }

  }
}