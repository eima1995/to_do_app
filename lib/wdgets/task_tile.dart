import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallBack;
  final Function longPressCallBack;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkBoxCallBack,
      this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
          activeColor: Color(0xFF111328),
          value: isChecked,
          onChanged: checkBoxCallBack),
    );
  }
}
