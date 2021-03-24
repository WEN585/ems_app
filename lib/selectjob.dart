import 'package:flutter/material.dart';

class SelectJobPage extends StatefulWidget {
  @override
  _SelectJobPageState createState() => _SelectJobPageState();
}

class _SelectJobPageState extends State<SelectJobPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Select Job'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
