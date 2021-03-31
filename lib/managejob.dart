import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ems_app/addJob.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ems_app/editJob.dart';

class ManageJobPage extends StatefulWidget {
  @override
  _ManageJobPageState createState() => _ManageJobPageState();
}

class _ManageJobPageState extends State<ManageJobPage> {
  CalendarController _controller;

  Future getData() async {
    var url = 'http://icebeary.com/EMS/viewjob.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Manage Job'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              calendarStyle: CalendarStyle(
                todayColor: Colors.greenAccent,
                selectedColor: Theme.of(context).accentColor,
                todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white),
              ),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              calendarController: _controller,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => new AddJobPage()));
        },
      ),
    );
  }

  // _showAddDialog() {
  // showDialog(
  // context: context,
  // builder: (context) => AlertDialog(
  // content: TextField(
  // controller: _eventController,
  // ),
  // actions: <Widget>[
  // FlatButton(
  // child: Text("Save"),
  // onPressed: () {
  // if (_eventController.text.isEmpty) return;
  // setState(() {
  // if (_eventController.text.isEmpty) return;
  // if (_event[_controller.selectedDay] != null) {
  // _event[_controller.selectedDay].add(_eventController.text);
  // } else {
  //_event[_controller.selectedDay] = [_eventController.text];
  // }
  // });
  // })
  // ],
  // ),
  // );

}
