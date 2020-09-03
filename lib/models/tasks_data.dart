// import 'package:flutter/material.dart';
import 'package:to_do_app/models/task.dart';
// import 'dart:collection';
// import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// class TaskData extends ChangeNotifier {
class TaskData {
  static List<Task> _tasks = [
    // Task(name: 'Buy milk'),
    // Task(name: 'Buy bread'),
  ];

  // Get tasks from shared preferences
  List<Task> getTasks() {
    return _tasks;
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
}

void main() {
  final String encodedData = TaskData.encodeTasks([
    Task(name: 'Buy milk'),
    Task(name: 'Buy bread'),
  ]);
  print(encodedData);

  print(TaskData.decodeTasks(encodedData)[0].name);
}
