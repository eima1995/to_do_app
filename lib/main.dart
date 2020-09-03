import 'package:flutter/material.dart';
import 'package:to_do_app/screens/tasks_screen.dart';
import 'models/tasks_data.dart';
import 'models/task.dart';
import 'models/sharedPref.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPref sharedPref = SharedPref();

  @override
  void initState() {
    // loadSharedPrefs();
    super.initState();
  }

  loadSharedPrefs() async {
    try {
      TaskData().setTasks(TaskData.decodeTasks(await sharedPref.read("tasks")));
    } catch (Excepetion) {
      print("Nothing to load");
    }

    // print(TaskData().getTasks()[0].name);
    // final String encodedData = TaskData.encodeTasks([
    //   Task(name: 'Buy milk'),
    //   Task(name: 'Buy bread'),
    // ]);
    // sharedPref.save('tasks', encodedData);
  }

  @override
  Widget build(BuildContext context) {
    // loadSharedPrefs();
    return ChangeNotifierProvider(
      builder: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
