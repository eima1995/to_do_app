import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/tasks_data.dart';
import 'package:to_do_app/wdgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:to_do_app/util/constants.dart';

class TasksScreen extends StatelessWidget {
  BannerAd bannerAd;

  TasksScreen() {
    // FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    // FirebaseAdMob.instance.initialize(appId: appId);
    // bannerAd = createBannerAd()..load();
    // bannerAd
    //   ..load()
    //   ..show(
    //     anchorType: AnchorType.top,
    //   );
  }

  BannerAd createBannerAd() {
    return BannerAd(
      // adUnitId: BannerAd.testAdUnitId,
      adUnitId: bannerID,
      size: AdSize.banner,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF111328),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF111328),
            child: Icon(
              Icons.add,
            ),
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
              padding:
                  EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text(
                    'To do list',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'to do: ${Provider.of<TaskData>(context).getCountCompletedTasks()} | done: ${Provider.of<TaskData>(context).getCountToDo()}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: TasksList(),
              ),
            ),
          ],
        ));
  }
}
