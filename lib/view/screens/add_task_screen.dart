import 'package:flutter/material.dart';
import 'package:todo/view/widgets/choose_color_widget.dart';
import 'package:todo/view/widgets/text_field_widget.dart';
import 'package:todo/view/widgets/custom_button.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String dropdownButtonValue = "Pending";

  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  var titleTask = TextEditingController();
  var desTask = TextEditingController();
  int colorSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
      appBar: AppBar(
        backgroundColor: Color(0xffF5F6FA),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          'Add Task',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textfieldwidget(
              controller: titleController,
              label: 'Task Title',
              text: 'Design Login Screen',
            ),
            SizedBox(height: 16),
            Textfieldwidget(
              controller: descriptionController,
              label: 'Description',
              text: 'Task Description...',
              maxLines: 4,
            ),
            SizedBox(height: 16),
            Text(
              "Status",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 48,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropdownButtonValue,
                underline: SizedBox(),
                items: [
                  DropdownMenuItem(
                    value: "Pending",
                    child: Text(
                      "Pending",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Done",
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      dropdownButtonValue = value;
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 18),
            Text(
              "Choose color",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            ChooseColorWidget(
              clickColor: (color) {
                colorSelected = color;
              },
            ),
            SizedBox(height: 24),
            CustomMaterialButton(onPressed: () {}, text: "Save"),
          ],
        ),
      ),
    );
  }
}
