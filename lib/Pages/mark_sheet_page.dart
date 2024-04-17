import 'dart:core';

import 'package:flutter/material.dart';
import 'package:progress_report/Pages/student_model.dart';
import 'package:progress_report/Pages/students_list.dart';
import 'package:progress_report/Widgets/build_custom_button_widget.dart';
import 'package:progress_report/Widgets/build_icons_widget.dart';
import 'package:progress_report/Widgets/build_student_mark_widget.dart';
import 'package:progress_report/Widgets/build_text_widget.dart';
import 'package:progress_report/main.dart';
import 'package:progress_report/services/constants.dart';

class MarkSheet extends StatefulWidget {
  final String name;
  final String studentClass;
  final String fatherName;
  final String motherName;
  final String phoneNumber;
  final String address;
  final String gender;
  final String dateOfBirth;
  final String physics;

  final int index;
  const MarkSheet({
    super.key,
    required this.index,
    required this.name,
    required this.fatherName,
    required this.motherName,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.dateOfBirth,
    required this.studentClass,
    required this.physics,
  });

  @override
  State<MarkSheet> createState() => _MarkSheetState();
}

class _MarkSheetState extends State<MarkSheet> {
  TextEditingController chemistryController = TextEditingController();
  TextEditingController biologyController = TextEditingController();
  TextEditingController socialScienceController = TextEditingController();
  TextEditingController mathematicsController = TextEditingController();
  TextEditingController physicsController = TextEditingController();
  TextEditingController englishController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    StudentModel student = box?.getAt(widget.index);
    physicsController.text = student.physics!;
    biologyController.text = student.biology!;
    englishController.text = student.english!;
    mathematicsController.text = student.mathematics!;
    socialScienceController.text = student.socialScience!;
    chemistryController.text = student.chemistry!;

    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: BuildTextWidget(
              text: "MarkSheet",
              color: Constants.colorList[1],
              size: 20,
              fontSize: FontWeight.w500),
          backgroundColor: Constants.colorList[0],
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: BuildIconWidget(
                color: Constants.colorList[1],
                icon: Icons.arrow_back_ios_new_outlined,
                size: 18),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                BuildTextWidget(
                    text: "Update Your Mark ",
                    color: Constants.colorList[2],
                    size: 20),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BuildStudentMarkWidget(
                      validator: (value) {
                        if (chemistryController.text.isEmpty) {
                          return "Enter your mark";
                        }
                        return null;
                      },
                      subjectController: chemistryController,
                      text: "Chemistry",
                      onTap: () {},
                    ),
                    BuildStudentMarkWidget(
                      validator: (value) {
                        if (biologyController.text.isEmpty) {
                          return "Enter your mark";
                        }
                        return null;
                      },
                      text: "Biology",
                      subjectController: biologyController,
                      onTap: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BuildStudentMarkWidget(
                      validator: (value) {
                        if (socialScienceController.text.isEmpty) {
                          return "Enter your mark";
                        }
                        return null;
                      },
                      text: "Social Science",
                      subjectController: socialScienceController,
                      onTap: () {},
                    ),
                    BuildStudentMarkWidget(
                      validator: (p0) {
                        if (mathematicsController.text.isEmpty &&
                            mathematicsController.text != "0") {
                          return "Enter your mark";
                        }
                        return null;
                      },
                      text: "Mathematics",
                      subjectController: mathematicsController,
                      onTap: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BuildStudentMarkWidget(
                      validator: (value) {
                        if (physicsController.text.isEmpty) {
                          return "Enter your Mark";
                        }
                        return null;
                      },
                      text: "Physics",
                      subjectController: physicsController,
                      onTap: () {},
                    ),
                    BuildStudentMarkWidget(
                      validator: (value) {
                        if (englishController.text != "0" &&
                            englishController.text.length != 2) {
                          return "Enter your mark";
                        }
                        return null;
                      },
                      text: "English",
                      subjectController: englishController,
                      onTap: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BuildCostomButtonWidget(
                    buttonName: "Submit",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        box?.putAt(
                          widget.index,
                          StudentModel(
                            studentClass: widget.studentClass,
                            fatherName: widget.fatherName,
                            motherName: widget.motherName,
                            dateOfBirth: widget.dateOfBirth,
                            gender: widget.gender,
                            name: widget.name,
                            phoneNumber: widget.phoneNumber,
                            addres: widget.address,
                            biology: biologyController.text,
                            chemistry: chemistryController.text,
                            mathematics: mathematicsController.text,
                            physics: physicsController.text,
                            english: englishController.text,
                            socialScience: socialScienceController.text,
                          ),
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StudentList(),
                            ));
                      }

                      print("biologyController.text");
                      print(socialScienceController.text);
                    },
                    radius: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
