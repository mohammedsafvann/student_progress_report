import 'package:flutter/material.dart';
import 'package:progress_report/Pages/student_model.dart';
import 'package:progress_report/Pages/students_list.dart';
import 'package:progress_report/Widgets/build_icons_widget.dart';
import 'package:progress_report/main.dart';
import 'package:progress_report/services/constants.dart';
import 'package:progress_report/services/utils.dart';

import 'build_text_widget.dart';

class BuildStudentRegisterWidget extends StatefulWidget {
  final int number;
  final int index;
  final String name;
  final String dateOfBirth;

  BuildStudentRegisterWidget(
      {super.key,
      required this.name,
      required this.number,
      required this.dateOfBirth,
      required this.index});

  @override
  State<BuildStudentRegisterWidget> createState() =>
      _BuildStudentRegisterState();
}

class _BuildStudentRegisterState extends State<BuildStudentRegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Constants.colorList[1],
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurStyle: BlurStyle.outer,
              blurRadius: 200,
              offset: Offset.fromDirection(20),
            )
          ],
        ),
        child: ListTile(
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BuildIconWidget(
                  color: Constants.colorList[0],
                  icon: Icons.import_contacts_outlined,
                  size: 25),
              InkWell(
                onTap: () {
                  print(box?.length);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: BuildTextWidget(
                          fontSize: FontWeight.w500,
                          text: "Delete",
                          color: Constants.colorList[2],
                          size: 20),
                      content: BuildTextWidget(
                          text: "Are you sure you want to delete this. ",
                          color: Constants.colorList[2],
                          size: 15),
                      actions: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: BuildTextWidget(
                              text: "Cancel",
                              color: Constants.colorList[2],
                              size: 16),
                        ),
                        InkWell(
                          onTap: () {
                            box?.deleteAt(widget.index);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentList(),
                              ),
                            );
                          },
                          child: BuildTextWidget(
                              fontSize: FontWeight.w400,
                              text: "Delete",
                              color: Constants.colorList[2],
                              size: 16),
                        ),
                      ],
                    ),
                  );
                },
                child: BuildIconWidget(
                    color: Constants.colorList[0],
                    icon: Icons.delete,
                    size: 25),
              )
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Constants.colorList[1],
            ),
          ),
          subtitle: BuildTextWidget(
              text: widget.dateOfBirth,
              color: Constants.colorList[0],
              size: 12),
          titleAlignment: ListTileTitleAlignment.center,
          title: BuildTextWidget(
              text: widget.name.toUpperCase(),
              color: Constants.colorList[2],
              size: 15,
              fontSize: FontWeight.w500),
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Constants.colorList[2],
            child: BuildTextWidget(
                text: widget.number.toString(),
                color: Constants.colorList[1],
                size: 20),
          ),
        ),
      ),
    );
  }
}
