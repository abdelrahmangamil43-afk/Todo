import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  int hexColor;

  @HiveField(3)
  StatusTask status;

  TaskModel({
    required this.description,
    required this.title,
    required this.hexColor,
    required this.status,
  });
}

@HiveType(typeId: 2)
enum StatusTask {
  @HiveField(0)
  pending,

  @HiveField(1)
  done,
}
