import 'package:flutter/material.dart';
import 'package:world_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}


class _ChooseLocationState extends State<ChooseLocation> {
  List <WorldTime> locations = [
    WorldTime(url: 'Africa/Addis_Ababa', location: 'Addis Ababa', flag: 'Ethiopia.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'southkorea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Buenos Aires', flag: 'argentina.png'),
    WorldTime(url: 'Indian/Maldives', location: 'Maldives', flag: 'india.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),



  ];

  void updateTime(index)
  async {
    WorldTime instance = locations[index];
    await instance.getdata();
    Navigator.pop(context,
    {
      "location" : instance.location,
      "flag" : instance.flag,
      "time" : instance.time,
      "isDay" :instance.isDay,
    });
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("Choose a location"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
      ),
      body: ListView.builder(
            itemCount: locations.length,
          itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                child: ListTile(
                onTap: ()
                  {
                    updateTime(index);
                  },
                title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/${locations[index].flag}"),
                  ),
                ),
                ),
              );
            }
    ),);
  }
}
