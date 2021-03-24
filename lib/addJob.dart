import 'package:flutter/material.dart';
import 'package:ems_app/managejob.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

class AddJobPage extends StatefulWidget {
  @override
  _AddJobPageState createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  TextEditingController _jobname_controller = TextEditingController();
  TextEditingController _jobdes_controller = TextEditingController();
  TextEditingController _wagesperhour_controller = TextEditingController();
  TextEditingController _duration_controller = TextEditingController();
  TextEditingController _workhour_controller = TextEditingController();
  TextEditingController _numberofworkers_controller = TextEditingController();

  Future<bool> _goBack() async {
    Navigator.of(context).pop(true);
    return false;
  }

  Future<bool> _onBackPressedWithButton() async {
    Navigator.of(context).pop(false);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressedWithButton,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomLeft,
              height: 80,
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _onBackPressedWithButton();
                  }),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text("Add Job",
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
            Expanded(
              child: Form(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          child: TextFormField(
                            controller: _jobname_controller,
                            decoration: InputDecoration(
                                labelText: "Job Name",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          child: TextFormField(
                            controller: _jobdes_controller,
                            textInputAction: TextInputAction.done,
                            minLines: 2,
                            maxLines: 4,
                            decoration: InputDecoration(
                                labelText: "Job Description",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          child: TextFormField(
                            controller: _wagesperhour_controller,
                            decoration: InputDecoration(
                                labelText: "Wages Per Hour",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          child: TextFormField(
                            controller: _duration_controller,
                            decoration: InputDecoration(
                                labelText: "Duration",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          child: TextFormField(
                            controller: _workhour_controller,
                            decoration: InputDecoration(
                                labelText: "Working Hours",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          child: TextFormField(
                            controller: _numberofworkers_controller,
                            decoration: InputDecoration(
                                labelText: "Number of Workers Needed",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: () {
                            _addjob();
                            Navigator.of(context).pushNamed('/managejob');
                          },
                          child: Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.redAccent,
                              color: Colors.red,
                              elevation: 7.0,
                              child: Center(
                                child: Text('Save',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
                          child: Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent,
                              color: Colors.green,
                              elevation: 7.0,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addjob() async {
    String _jobname = _jobname_controller.text;
    String _jobdes = _jobdes_controller.text;
    String _wagesperhour = _wagesperhour_controller.text;
    String _duration = _duration_controller.text;
    String _workhour = _workhour_controller.text;
    String _numberofworkers = _numberofworkers_controller.text;

    ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    pr.style(message: "Adding Job...");
    await pr.show();
    http.post("http://icebeary.com/EMS/addjob.php", body: {
      "jobname": _jobname,
      "jobdes": _jobdes,
      "wagesperhour": _wagesperhour,
      "duration": _duration,
      "workhour": _workhour,
      "numberofworkers": _numberofworkers,
    }).then((res) {
      print(res.body);
      if (res.body == "success") {
        Toast.show(
          "Add Job Success.",
          context,
          duration: 2,
          gravity: Toast.BOTTOM,
        );
        Navigator.of(context).pop();
      } else {
        Toast.show(
          "Add Job failed",
          context,
          duration: 2,
          gravity: Toast.BOTTOM,
        );
      }
    }).catchError((err) {
      print(err);
    });
    await pr.hide();
  }
}
