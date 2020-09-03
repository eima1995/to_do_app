import 'package:flutter/material.dart';
import 'package:to_do_app/screens/tasks_screen.dart';
import 'models/tasks_data.dart';
import 'models/task.dart';
import 'models/sharedPref.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPref sharedPref = SharedPref();

  loadSharedPrefs() async {
    try {
      List<Task> tasks = TaskData.decodeTasks(await sharedPref.read("tasks"));
      print(tasks[1].name.toString());
    } catch (Excepetion) {
      print("Nothing to load");
    }

    final String encodedData = TaskData.encodeTasks([
      Task(name: 'Buy milk'),
      Task(name: 'Buy bread'),
    ]);
    sharedPref.save('tasks', encodedData);
  }

  @override
  Widget build(BuildContext context) {
    loadSharedPrefs();
    return MaterialApp(
      home: TasksScreen(),
    );
  }
}
