import 'package:flutter/material.dart';

class ChooseColorWidget extends StatefulWidget {
  ChooseColorWidget({super.key, required this.clickColor});

  final void Function(int) clickColor;

  @override
  State<ChooseColorWidget> createState() => _ChooseColorWidgetState();
}

class _ChooseColorWidgetState extends State<ChooseColorWidget> {
  List<int> colorHex = [0xff2196F3, 0xff4CAF50, 0xffFF9800, 0xff9C27B0];

  int selectedColor = 0xff2196F3;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        ...colorHex.map((e) => colorContainer(e, selectedColor == e)).toList(),
      ],
    );
  }

  Widget colorContainer(int colorHex, bool isSelected) {
    return InkWell(
      onTap: () {
        selectedColor = colorHex;

        widget.clickColor(colorHex);

        setState(() {});
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Color(colorHex),
          borderRadius: BorderRadius.circular(50),
          border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
        ),
      ),
    );
  }
}
