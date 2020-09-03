import 'package:flutter/material.dart';
import 'package:to_do_app/util/constants.dart' as Constants;
import 'package:to_do_app/wdgets/tasks_list.dart';
import 'package:to_do_app/screens/add_task_screen.dart';
import 'package:to_do_app/models/tasks_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Consumer<TaskData>(builder: (context, taskData, child) {
    return Scaffold(
      backgroundColor: Constants.TASKS_SCREEN_BACKGROUND_COLOR,
      floatingActionButton: FloatingActionButton(
          backgroundColor:
              Constants.TASKS_SCREEN_FLOATING_ACTION_BUTTON_BACKGROUND_COLOR,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                    child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AddTaskScreen())));
          }),
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
    // });
  }
}
