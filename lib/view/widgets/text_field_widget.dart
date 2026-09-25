import 'package:flutter/material.dart';

class Textfieldwidget extends StatelessWidget {
  const Textfieldwidget({
    super.key,
    this.controller,
    this.validator,
    required this.label,
    required this.text,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w200,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 5),

          TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              hint: Text(text, style: TextStyle(color: Colors.grey)),
              fillColor: Colors.white,
              filled: true,

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.blue),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent),
              ),

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
