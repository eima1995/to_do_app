import 'package:flutter/material.dart';
import 'package:to_do_app/wdgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TaskTile(
          taskTitle: "Go to gym",
          isChecked: true,
          checkBoxCallBack: (bool checkBoxState) {},
          longPressCallBack: () {},
        ),
        TaskTile(
          taskTitle: "Go to gym",
          isChecked: false,
          checkBoxCallBack: (bool checkBoxState) {},
          longPressCallBack: () {},
        ),
      ],
    );
  }
}
