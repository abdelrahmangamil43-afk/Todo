import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/core/app_routes.dart';
import 'package:todo/data/model/task_model.dart';
import 'package:todo/data/model/user_model.dart';
import 'package:todo/view/widgets/header_widget.dart';
import 'package:todo/view/widgets/task_info_details.dart';
import 'package:todo/view/widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [];
  int numOfTasks = 0;
  int numOfPending = 0;
  int numOfDone = 0;
  @override
  void initState() {
    super.initState();
    getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F7FB),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),

        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 60),
            HeaderWidget(fullName: getName()),
            TaskInfoDetails(
              numOfTasks: numOfTasks,
              numOfPending: numOfPending,
              numOfDone: numOfDone,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => TaskItem(
                  task: tasks[index],
                  delete: () {
                    deleteItem(index);
                  },
                ),
                itemCount: tasks.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xffDDE3FF),
        foregroundColor: Color(0xff3F51B5),
        onPressed: () async {
          await Navigator.pushNamed(context, AppRoutes.addtask);
          getAllTasks();
        },

        icon: Icon(Icons.add),
        label: Text("Task"),
      ),
    );
  }

  void getAllTasks() {
    var taskBox = Hive.box<TaskModel>("Tasks");
    tasks = taskBox.values.toList();
    numbers();
    setState(() {});
  }

  String getName() {
    var taskBox = Hive.box<UserModel>("User");
    var user = taskBox.get("userkey");
    return user?.fullName ?? "Error From Name";
  }

  void numbers() {
    numOfTasks = tasks.length;
    numOfDone = tasks.where((e) => e.status == StatusTask.done).toList().length;
    numOfPending = tasks
        .where((e) => e.status == StatusTask.done)
        .toList()
        .length;
  }

  void deleteItem(int index) {
    var taskBox = Hive.box<TaskModel>("Tasks");
    taskBox.deleteAt(index);
    tasks.removeAt(index);
    setState(() {});
  }
}
