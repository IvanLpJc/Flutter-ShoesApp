import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActionButton extends StatelessWidget {
  final String text;

  final double height;
  final double width;
  final Color color;

  const ActionButton(
      {super.key,
      required this.text,
      this.height = 50,
      this.width = 150,
      this.color = const Color.fromARGB(255, 218, 166, 37)});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius:
            height < 21 ? BorderRadius.circular(5) : BorderRadius.circular(8),
        color: color,
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
