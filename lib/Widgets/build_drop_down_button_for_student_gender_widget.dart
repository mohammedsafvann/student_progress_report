import 'package:flutter/material.dart';
import 'package:progress_report/Widgets/build_icons_widget.dart';
import 'package:progress_report/Widgets/build_text_widget.dart';
import 'package:progress_report/services/constants.dart';

class BuildDropDownButtonForStudentGenderwidget extends StatefulWidget {
  final List<String> gender;
  final Function(String value) validation;

  const BuildDropDownButtonForStudentGenderwidget({
    super.key,
    required this.gender,
    required this.validation,
  });

  @override
  State<BuildDropDownButtonForStudentGenderwidget> createState() =>
      _BuildDropDownButtonForStudentGenderState();
}

class _BuildDropDownButtonForStudentGenderState
    extends State<BuildDropDownButtonForStudentGenderwidget> {
  String? dropDownValue;

  @override
  void initState() {
    dropDownValue = widget.gender[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (value) {
        widget.validation(dropDownValue ?? "");
      },
      dropdownColor: Colors.grey[200],
      borderRadius: BorderRadius.circular(5),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        focusColor: Constants.colorList[1],
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Constants.colorList[1], width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Constants.colorList[1], width: 2.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Constants.colorList[1], width: 2.0),
        ),
      ),
      // Initial Value
      value: dropDownValue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: widget.gender.map(
        (String items) {
          return DropdownMenuItem(
            value: items,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: BuildTextWidget(
                  text: items, color: Constants.colorList[2], size: 13),
            ),
            // child: Text(items,),
          );
        },
      ).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropDownValue = newValue!;
          print('dropDownValue');
          print(dropDownValue);
        });
      },
    );
  }
}
