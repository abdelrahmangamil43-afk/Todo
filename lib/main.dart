import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/core/app_routes.dart';
import 'package:todo/data/model/user_model.dart';
import 'package:todo/view/screens/add_task_screen.dart';
import 'package:todo/view/screens/home_screen.dart';
import 'package:todo/view/screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.openBox<UserModel>('User');
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.profile,
      routes: {
        AppRoutes.profile: (context) => ProfileScreen(),
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.addtask: (context) => AddTaskScreen(),
      },
    );
  }
}
