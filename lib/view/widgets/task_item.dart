import 'package:flutter/material.dart';
import 'package:todo/data/model/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task, required this.delete});
  final TaskModel task;
  final void Function()? delete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        spacing: 10,
        children: [
          Container(
            height: 50,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(task.hexColor),
            ),
          ),
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                task.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  task.description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(task.hexColor).withAlpha(100),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  task.status == StatusTask.pending ? "Pending" : "Done",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(task.hexColor),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: delete,
            icon: Icon(Icons.delete, color: Colors.red, size: 40),
          ),
        ],
      ),
    );
  }
}
