import 'package:flutter/material.dart';

class WagesCalculatorPage extends StatefulWidget {
  @override
  _WagesCalculatorPageState createState() => _WagesCalculatorPageState();
}

class _WagesCalculatorPageState extends State<WagesCalculatorPage> {
  var _operation = ['Add', 'Subtraction', 'Multiply', 'Devide'];
  var _values = "Add";
  var _displayText = "";

  TextEditingController textBox1 = TextEditingController();
  TextEditingController textBox2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Wages Calculation'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
        child: ListView(
          children: <Widget>[
            DropdownButton<String>(
              value: _values,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
              items: _operation.map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _values = value;
                  print("Value changed to $value");
                });
                value = _values;
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Job Name",
                hintText: "Job Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.green)),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
              controller: textBox1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Wages Per Hour",
                hintText: "Wages Per Hour",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.green)),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
              controller: textBox2,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Total Working Time",
                hintText: "Total Working Time",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.green)),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              alignment: Alignment(0.1, 0.0),
              padding: EdgeInsets.only(top: 15.0, right: 10.0),
              child: Text(
                _displayText,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    elevation: 7.0,
                    color: Colors.greenAccent,
                    onPressed: () {
                      setState(() {
                        double first = double.parse(textBox1.text);
                        double second = double.parse(textBox2.text);

                        switch (_values) {
                          case "Add":
                            var sum = first + second;
                            _displayText =
                                "The result is " + sum.toStringAsFixed(0);
                            break;

                          case "Subtraction":
                            var dif = first - second;
                            _displayText =
                                "The result is " + dif.toStringAsFixed(0);
                            break;

                          case "Multiply":
                            var mul = first * second;
                            _displayText =
                                "The result is " + mul.toStringAsFixed(0);
                            break;

                          case "Divide":
                            var div = first / second;
                            _displayText =
                                "The result is " + div.toStringAsFixed(0);
                            break;
                          default:
                            _displayText = "Something Went Wrong";
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      'Clear',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    elevation: 7.0,
                    color: Colors.greenAccent,
                    onPressed: () {
                      setState(() {
                        _clearAll();
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _clearAll() {
    textBox1.text = "";
    textBox2.text = "";
  }
}
