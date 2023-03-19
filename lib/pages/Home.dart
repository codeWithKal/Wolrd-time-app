import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data : ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);
    String bgimage = data["isDay"] ? "day.jpg" : "night.jpg";
    Color? bgcolor = data["isDay"] ? Colors.indigo[900] : Colors.brown[900];
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgimage"),
              fit: BoxFit.cover,
          ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, "/location");
                      if (result != null) {
                        setState(() {
                        data = {
                          "time" : result["time"],
                          "location" : result["location"],
                          "isDay" : result["isDay"],
                          "flag" : result["flag"]
                        };
                      });
                      }
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey,),
                      label: Text(
                        "Edit location",
                    style: TextStyle(
                      color: Colors.grey
                    ),)),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text(
                            data["location"],
                          style: TextStyle(
                            fontSize: 28.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                SizedBox(height: 20.0),
                Text(
                    data["time"],
                  style: TextStyle(
                    fontSize: 60.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
