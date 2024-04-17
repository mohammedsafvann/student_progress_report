import 'package:flutter/material.dart';

import '../services/constants.dart';
import '../services/utils.dart';
import 'build_text_widget.dart';

class BuildDetailsBoxWidget extends StatefulWidget {
  final String subject;
  final String marks;
  final String? grade;
  final FontWeight? fontSize;

  const BuildDetailsBoxWidget({
    super.key,
    required this.subject,
    required this.marks,
    this.fontSize,
    this.grade,
  });

  @override
  State<BuildDetailsBoxWidget> createState() => _BuildDetailsBoxWidgetState();
}

class _BuildDetailsBoxWidgetState extends State<BuildDetailsBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: screenWidth(context, dividedBy: 3.2),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: BuildTextWidget(
              fontSize: widget.fontSize,
              text: widget.subject,
              color: Constants.colorList[2],
              size: 15,
            ),
          ),
        ),
        SizedBox(
          width: screenWidth(context, dividedBy: 25),
          child: Center(
            child: BuildTextWidget(
              text: ":",
              color: Constants.colorList[2],
              size: 15,
            ),
          ),
        ),
        SizedBox(
          width: screenWidth(context, dividedBy: 2.6),
          child: BuildTextWidget(
            fontSize: widget.fontSize,
            text: '${widget.marks}              ${widget.grade}',
            color: Constants.colorList[2],
            size: 15,
          ),
        ),
      ],
    );
  }
}
