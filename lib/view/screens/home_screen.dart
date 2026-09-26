import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/core/app_routes.dart';
import 'package:todo/data/model/task_model.dart';
import 'package:todo/data/model/user_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),

      body: ValueListenableBuilder(
        valueListenable: Hive.box<UserModel>('User').listenable(),
        builder: (context, Box<UserModel> userBox, _) {
          var user = userBox.get('userkey');

          return ValueListenableBuilder(
            valueListenable: Hive.box<TaskModel>('Tasks').listenable(),
            builder: (context, Box<TaskModel> taskBox, _) {
              var tasks = taskBox.values.toList();

              var doneTasks = tasks
                  .where((task) => task.status == StatusTask.done)
                  .length;

              var pendingTasks = tasks
                  .where((task) => task.status == StatusTask.pending)
                  .length;

              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),

                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff3F51B5),
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),

                          SizedBox(width: 12),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good Morning 👋",
                                style: TextStyle(
                                  color: Color(0xff999999),
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                user?.fullName ?? "",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          Spacer(),

                          Icon(
                            Icons.notifications_none,
                            color: Colors.black,
                            size: 25,
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff3F51B5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "${tasks.length}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Tasks",
                                  style: TextStyle(
                                    color: Color(0xffC8CEEA),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Text(
                                  "$doneTasks",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Done",
                                  style: TextStyle(
                                    color: Color(0xffC8CEEA),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Text(
                                  "$pendingTasks",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Pending",
                                  style: TextStyle(
                                    color: Color(0xffC8CEEA),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 22),

                      Text(
                        "Today's Tasks",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 12),

                      Expanded(
                        child: tasks.isEmpty
                            ? Center(
                                child: Text(
                                  "No Tasks Yet",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: tasks.length,
                                itemBuilder: (context, index) {
                                  var task = tasks[index];

                                  return Container(
                                    margin: EdgeInsets.only(bottom: 12),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.04),
                                          blurRadius: 8,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 52,
                                          decoration: BoxDecoration(
                                            color: Color(task.hexColor),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: 14),

                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                task.title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              SizedBox(height: 5),

                                              Text(
                                                task.description,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),
                                              ),

                                              SizedBox(height: 7),

                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  color:
                                                      task.status ==
                                                          StatusTask.done
                                                      ? Color(0xffE4F5E7)
                                                      : Color(0xffE1F0FF),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  task.status == StatusTask.done
                                                      ? "Done"
                                                      : "Pending",
                                                  style: TextStyle(
                                                    color:
                                                        task.status ==
                                                            StatusTask.done
                                                        ? Colors.green
                                                        : Colors.blue,
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Icon(
                                          Icons.chevron_right,
                                          color: Colors.black54,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xffDDE3FF),
        foregroundColor: Color(0xff3F51B5),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addtask);
        },
        icon: Icon(Icons.add),
        label: Text("Task"),
      ),
    );
  }
}
