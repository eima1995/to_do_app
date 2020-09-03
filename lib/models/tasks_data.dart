import 'package:flutter/material.dart';
import 'package:to_do_app/models/task.dart';
// import 'dart:collection';
// import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:to_do_app/models/sharedPref.dart';

class TaskData extends ChangeNotifier {
// class TaskData {
  static List<Task> _tasks = [
    // Task(name: 'Buy milk'),
    // Task(name: 'Buy bread'),
  ];

  void saveTasksToMemory() {
    SharedPref sharedPref = SharedPref();
    final String encodedData = TaskData.encodeTasks(_tasks);
    sharedPref.save('tasks', encodedData);
  }

  void loadSharedPrefs() async {
    SharedPref sharedPref = SharedPref();
    try {
      TaskData().setTasks(TaskData.decodeTasks(await sharedPref.read("tasks")));
      print(TaskData().getTasks().length);
    } catch (Excepetion) {
      print("Nothing to load");
    }
  }

  List<Task> getTasks() {
    return _tasks;
  }

  int getCount() {
    return _tasks.length;
  }

  setTasks(List<Task> tasks) {
    _tasks = tasks;
  }

  static Map<String, dynamic> toMap(Task task) => {
        'name': task.name,
        'isDone': task.isDone,
      };

  static String encodeTasks(List<Task> task) => json.encode(
        task.map<Map<String, dynamic>>((task) => TaskData.toMap(task)).toList(),
      );

  static List<Task> decodeTasks(String task) =>
      (json.decode(task) as List<dynamic>)
          .map<Task>((task) => Task.fromJson(task))
          .toList();

  void addTask(String name) {
    final task = Task(name: name);
    _tasks.add(task);
    saveTasksToMemory();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toogleDone();
    saveTasksToMemory();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    saveTasksToMemory();
    notifyListeners();
  }

  int getCountToDo() {
    int counter = 0;
    for (Task task in _tasks) {
      if (task.isDone) {
        counter += 1;
      }
    }
    notifyListeners();
    return counter;
  }
}
