import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
              style: TextStyle(fontSize: 20, fontWeight: .bold),
            ),
            SizedBox(height: 10),
            Text(
              "Add your name and profile picture",
              style: TextStyle(
                fontSize: 12,
                fontWeight: .w400,
                color: Color(0xff8F8F90),
              ),
            ),
            SizedBox(height: 40),

            SizedBox(height: 5),
            Textfieldwidget(
              label: "Full Name",
              controller: fullname,
              validator: (value) {
                if (value == null) {
                  return "Enter your name";
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20),
              ),
              minWidth: 300,
              padding: EdgeInsets.all(10),
              onPressed: () {},
              color: Color(0xff3F51B5),
              child: Text(
                "Create",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Textfieldwidget extends StatelessWidget {
  const Textfieldwidget({
    super.key,
    this.controller,
    this.validator,
    required this.label,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: .w200,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              hint: Text(
                "Enter your name",
                style: TextStyle(color: Colors.grey),
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
