import 'package:flutter/material.dart';

class TaskInfoDetails extends StatelessWidget {
  const TaskInfoDetails({
    super.key,
    required this.numOfTasks,
    required this.numOfPending,
    required this.numOfDone,
  });
  final int numOfTasks;
  final int numOfPending;
  final int numOfDone;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xff3F51B5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          item(numOfTasks, "Tasks"),
          item(numOfPending, "Pednding"),
          item(numOfDone, "Done"),
        ],
      ),
    );
  }

  Widget item(int num, String des) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          num.toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          des.toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
