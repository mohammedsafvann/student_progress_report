import 'package:flutter/material.dart';
import 'package:progress_report/services/constants.dart';

import '../services/constants.dart';
import '../services/constants.dart';
import '../services/constants.dart';

class BuildCostomButtonWidget extends StatefulWidget {
  final String buttonName;
  final double? radius;
  final Function onPressed;

  const BuildCostomButtonWidget({
    super.key,
    required this.buttonName,
    this.radius,
    required this.onPressed,
  });

  @override
  State<BuildCostomButtonWidget> createState() => _BuildCostomButtonState();
}

class _BuildCostomButtonState extends State<BuildCostomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          widget.onPressed();
        },
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 0),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(Constants.colorList[0]),
        ),
        child: Text(
          widget.buttonName,
          style: TextStyle(color: Constants.colorList[1]),
        ));
  }
}
