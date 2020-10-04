import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:to_do_app/screens/tasks_screen.dart';
import 'package:to_do_app/models/tasks_data.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black,
          size: 100,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    TaskData().loadSharedPrefs();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TasksScreen(),
      ),
    );
  }
}
