import 'package:flutter/material.dart';

class BuildIconWidget extends StatefulWidget {
  IconData icon;
  Color color;
  double size;

  BuildIconWidget(
      {super.key, required this.color, required this.icon, required this.size});

  @override
  State<BuildIconWidget> createState() => _BuildIconsState();
}

class _BuildIconsState extends State<BuildIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.icon,
      color: widget.color,
      size: widget.size,
    );
  }
}
