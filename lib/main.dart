import 'package:flutter/material.dart';
import 'package:to_do_app/screens/tasks_screen.dart';
import 'models/tasks_data.dart';
import 'models/task.dart';
import 'models/sharedPref.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/tasks_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //all widgets are rendered here
  await TaskData().loadSharedPrefs();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    // TaskData().loadSharedPrefs();
    print("Init state " + TaskData().getCount().toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
