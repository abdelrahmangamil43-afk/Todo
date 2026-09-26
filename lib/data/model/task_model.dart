class TaskModel {
  String title;
  String description;
  int hexColor;
  StatusTask status;
  TaskModel({
    required this.description,
    required this.title,
    required this.hexColor,
    required this.status,
  });
}

enum StatusTask { pending, done }
