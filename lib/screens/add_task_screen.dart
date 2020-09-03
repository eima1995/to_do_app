import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/tasks_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      color: Color(0xFF111328),
      child: Container(
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        // child: Text("test"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF111328),
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              cursorColor: Color(0xFF111328),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
              textInputAction: TextInputAction.search,
              onSubmitted: (newText) {
                newTaskTitle = newText;
                if (newTaskTitle != '') {
                  Provider.of<TaskData>(context).addTask(newTaskTitle);
                }
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                hintText: 'Type Text Here',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            FlatButton(
              highlightColor: Color(0xFF111328),
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFF111328),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                if (newTaskTitle != '') {
                  Provider.of<TaskData>(context).addTask(newTaskTitle);
                }
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
