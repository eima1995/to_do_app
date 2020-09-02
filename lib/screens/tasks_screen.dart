import 'package:flutter/material.dart';
import 'package:to_do_app/util/constants.dart' as Constants;
import 'package:to_do_app/wdgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.TASKS_SCREEN_BACKGROUND_COLOR,
      floatingActionButton: FloatingActionButton(
          backgroundColor:
              Constants.TASKS_SCREEN_FLOATING_ACTION_BUTTON_BACKGROUND_COLOR,
          child: Icon(Icons.add),
          onPressed: null),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                  "To do list",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
                Text("to do: 1 | done: 1",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Constants.TASKS_SCREEN_TASKS_BACKGROUND_COLOR,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
