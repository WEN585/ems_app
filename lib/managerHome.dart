import 'package:ems_app/wagescalculator.dart';
import 'package:flutter/material.dart';
import 'package:ems_app/managejob.dart';
import 'package:ems_app/login.dart';
import 'package:ems_app/global_state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ems_app/editJob.dart';

class ManagerHomePage extends StatefulWidget {
  @override
  _ManagerHomePageState createState() => _ManagerHomePageState();
}

class _ManagerHomePageState extends State<ManagerHomePage> {
  Global_State _global_key = Global_State.instance;
  var locationMessage = "";
  String latitude;
  String longitude;

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;

    latitude = "$lat";
    longitude = "$long";

    setState(() {
      locationMessage = "Latitude: $lat and Longitude: $long";
    });
  }

  void googleMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else
      throw ("Couldn't open google maps");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on,
            size: 45.0,
            color: Colors.red,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Share Live Location",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            locationMessage,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 05.0,
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            elevation: 20.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(200.0)),
            color: Colors.black,
            child: Text("Get Current Location"),
            textColor: Colors.white,
            splashColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.8),
            onPressed: () {
              getCurrentLocation();
            },
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            elevation: 20.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(200.0)),
            color: Colors.black,
            child: Text("Open Google Map"),
            textColor: Colors.white,
            splashColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            onPressed: () {
              googleMap();
            },
          ),
        ],
      )),
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
          backgroundColor: Colors.green, title: new Text('Manager Home')),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              child: new UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                accountName: new Text("${_global_key.user_list[0]["id"]}"),
                accountEmail: new Text("${_global_key.user_list[0]["email"]}"),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage:
                      new NetworkImage('https://i.pravatar.cc/300'),
                ),
              ),
            ),
            new ListTile(
              leading: Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
              title: new Text('Manage Job'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new ManageJobPage()));
              },
            ),
            /*new ListTile(
              leading: Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
              title: new Text('Edit Job'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new EditJobPage()));
              },
            ),*/
            new Divider(
              color: Colors.green,
              height: 5.0,
            ),
            new ListTile(
              leading: Icon(
                Icons.calculate,
                color: Colors.black,
              ),
              title: new Text('Wages Calculation'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new WagesCalculatorPage()));
              },
            ),
            new Divider(
              color: Colors.green,
              height: 5.0,
            ),
            new ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: new Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new LoginPage()));
              },
            ),
            new Divider(
              color: Colors.green,
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
