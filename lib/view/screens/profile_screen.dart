import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/core/app_dialog.dart';
import 'package:todo/core/app_routes.dart';
import 'package:todo/data/model/user_model.dart';
import 'package:todo/view/widgets/custom_button.dart';
import 'package:todo/view/widgets/text_field_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final fullname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F7FB),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xffE8ECF5),
              ),
              child: Icon(Icons.person, color: Color(0xff3F51B5), size: 60),
            ),
            SizedBox(height: 20),
            Text(
              "Create Your Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Add your name and profile picture",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff8F8F90),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(height: 5),
            Textfieldwidget(
              label: "Full Name",
              text: "Enter your name",
              controller: fullname,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Your Name";
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            CustomMaterialButton(
              text: "Create",

              onPressed: () async {
                AppDialog.showLoading(context);

                var userBox = Hive.box<UserModel>('User');

                await userBox
                    .put("userkey", UserModel(fullName: fullname.text))
                    .then((value) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(AppRoutes.home);
                    })
                    .catchError((error) {
                      log(error);
                      ScaffoldMessenger.of(error).showSnackBar(
                        SnackBar(content: Text("Something went wrong")),
                      );
                    });
                // var getFullName = userBox.get("UserKey");
                // log(getFullName?.fullName ?? "Null");
              },
            ),
          ],
        ),
      ),
    );
  }
}
