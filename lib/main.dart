import 'package:flutter/material.dart';
import 'package:well/Services/databaseServices.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Well App',
      home: MyHomePage(title: 'Well'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  bool _isMotorRunning = false;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    widget._isMotorRunning = DatabaseServices().getMotorStatus() ?? false;    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Center(
          child: FlatButton(
            color: (widget._isMotorRunning) ? Colors.red : Colors.green,
            onPressed: () {
              DatabaseServices().updateMotorStatus((widget._isMotorRunning) ? 'OFF' : 'ON');
              setState(() {
                widget._isMotorRunning = !widget._isMotorRunning;
              });
            },
            child: Text((widget._isMotorRunning) ? 'OFF' : 'ON'),
          ),
        ),
      ),
    );
  }
}
