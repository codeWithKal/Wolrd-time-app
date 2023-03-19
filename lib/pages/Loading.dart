import 'package:flutter/material.dart';
import 'package:world_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupTime()
  async {
    WorldTime instance = WorldTime(location: "Addis Ababa", flag: "Green Red yellow", url: "/Africa/Addis_Ababa");
    await instance.getdata();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location" : instance.location,
      "flag" : instance.flag,
      "time" : instance.time,
      "isDay" :instance.isDay,
    });
  }
  @override
  void initState() {

    super.initState();
    setupTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: SpinKitRing(
        color: Colors.black,
        size: 80.0,
      ),
      ),
    );
  }
}

