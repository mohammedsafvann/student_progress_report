import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:progress_report/Widgets/build_icons_widget.dart';
import 'package:progress_report/services/constants.dart';

class BuildTextFieldWidget extends StatefulWidget {
  String hintText;
  TextEditingController? textEditingController;
  final Function? onTap;
  final bool? isVisible;
  final bool readOnly;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  BuildTextFieldWidget({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.onTap,
    this.isVisible,
    required this.readOnly,
    this.keyboard,
    this.validator,
    // required this.validation
  });

  @override
  State<BuildTextFieldWidget> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextFieldWidget> {
  TextEditingController dateInputController = TextEditingController();
  @override
  // void initState() {
  //   // widget.textEditingController = dateInputController;
  //   // widget.textEditingController;
  //   // TODO: implement initState
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        validator: widget.validator,
        // validator: (value) => widget.validation(),
        keyboardType: widget.keyboard,
        style: TextStyle(color: Constants.colorList[2]),
        readOnly: widget.readOnly,

        controller: widget.textEditingController,
        // onChanged: (String mmmm) {
        //   print(mmmm + "???");
        // },
        onTap: () {
          widget.onTap!();
        },
        decoration: InputDecoration(
          label: Text(widget.hintText),
          suffixIcon: widget.isVisible!

              // ? Icon(Icons.calendar_month_outlined)
              ? IconButton(
                  onPressed: () {}, icon: Icon(Icons.calendar_month_outlined))
              : SizedBox(),
          // BuildIcons(
          //     color: Colors.blueGrey,
          //     icon: Icon(Icons.calendar_month_outlined),
          //     size: 20),
          filled: true,
          fillColor: Colors.grey[200],
          focusColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constants.colorList[1], width: 2.0),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Constants.colorList[1], width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constants.colorList[1], width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Constants.colorList[1]),
        ),
      ),
    );
  }
}
