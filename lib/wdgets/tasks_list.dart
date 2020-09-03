import 'package:flutter/material.dart';
import 'package:to_do_app/wdgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/tasks_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print("taskList");
    TaskData().loadSharedPrefs();
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Theme(
          data: Theme.of(context).copyWith(accentColor: Color(0xFF111328)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.getTasks()[index];
              return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkBoxCallBack: (bool checkBoxState) {
                  taskData.updateTask(task);
                },
                longPressCallBack: () {
                  taskData.deleteTask(task);
                },
              );
            },
            itemCount: taskData.getCount(),
          ),
        );
      },
    );

    // ListView(
    //   children: <Widget>[
    //     TaskTile(
    //       taskTitle: "Go to gym",
    //       isChecked: true,
    //       checkBoxCallBack: (bool checkBoxState) {},
    //       longPressCallBack: () {},
    //     ),
    //     TaskTile(
    //       taskTitle: "Go to gym",
    //       isChecked: false,
    //       checkBoxCallBack: (bool checkBoxState) {},
    //       longPressCallBack: () {},
    //     ),
    //   ],
    // );
  }
}
