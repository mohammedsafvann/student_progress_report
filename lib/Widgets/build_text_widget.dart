import 'package:flutter/material.dart';

class BuildTextWidget extends StatefulWidget {
  String text;
  Color color;
  double? height;
  double size;
  FontWeight? fontSize;

  BuildTextWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.size,
      this.fontSize,
      this.height});

  @override
  State<BuildTextWidget> createState() => _BuildTextState();
}

class _BuildTextState extends State<BuildTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.color,
          height: widget.height,
          fontSize: widget.size,
          fontWeight: widget.fontSize),
    );
  }
}
