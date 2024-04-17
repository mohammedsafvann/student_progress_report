import 'package:flutter/material.dart';
import 'package:progress_report/Widgets/build_text_widget.dart';
import 'package:progress_report/services/constants.dart';

class BuildStudentMarkWidget extends StatefulWidget {
  final Function onTap;
  final String text;
  final TextEditingController? subjectController;
  final String? Function(String?)? validator;
  const BuildStudentMarkWidget(
      {super.key,
      required this.text,
      this.subjectController,
      required this.onTap,
      this.validator});

  @override
  State<BuildStudentMarkWidget> createState() =>
      _BuildTextFormfieldForStudentMarkState();
}

class _BuildTextFormfieldForStudentMarkState
    extends State<BuildStudentMarkWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      child: TextFormField(
        validator: widget.validator,
        keyboardType: TextInputType.number,
        controller: widget.subjectController,
        onTap: () {
          widget.onTap;
        },
        style: TextStyle(color: Constants.colorList[2]),
        decoration: InputDecoration(
          label: Text(widget.text),
          hintText: widget.text,
          filled: true,
          fillColor: Colors.grey[200],
          focusColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
