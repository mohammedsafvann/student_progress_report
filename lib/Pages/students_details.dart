import 'package:flutter/material.dart';
import 'package:progress_report/Pages/edit_student_details_page.dart';

import 'package:progress_report/Pages/student_model.dart';

import 'package:progress_report/Widgets/build_custom_button_widget.dart';
import 'package:progress_report/Widgets/build_detials_box_widget.dart';
import 'package:progress_report/Widgets/build_icons_widget.dart';
import 'package:progress_report/Widgets/build_text_widget.dart';
import 'package:progress_report/main.dart';
import 'package:progress_report/services/constants.dart';
import 'package:progress_report/services/utils.dart';

import 'mark_sheet_page.dart';

class StudentDetails extends StatefulWidget {
  final int index;
  final String name;
  final String gender;
  final String fatherName;
  final String motherName;
  final String PhoeNumber;
  final String adrress;
  final String Class;
  final String dateOfBirth;
  final double mathematics;
  final double socialScience;
  final double biology;
  final double chemistry;
  final double physics;
  final double english;

  StudentDetails(
      {super.key,
      genderList,
      required this.name,
      required this.dateOfBirth,
      required this.gender,
      required this.fatherName,
      required this.motherName,
      required this.PhoeNumber,
      required this.adrress,
      required this.Class,
      required this.index,
      required this.mathematics,
      required this.socialScience,
      required this.biology,
      required this.chemistry,
      required this.physics,
      required this.english});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  double totalMark = 0;
  double percentage = 0;

  @override
  void initState() {
    print("widget.gender");
    print(widget.gender);
    totalMark = findTotal(
      biology: widget.biology,
      physics: widget.physics,
      chemistry: widget.chemistry,
      socialScience: widget.socialScience,
      english: widget.english,
      mathematics: widget.mathematics,
    );
    percentage = findPercentage(totalMark: totalMark);

    // TODO: implement initState
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  double findTotal({
    required double socialScience,
    required double chemistry,
    required double biology,
    required double english,
    required double mathematics,
    required double physics,
  }) {
    double total = 0;
    total =
        socialScience + chemistry + biology + english + mathematics + physics;
    return total;
  }

  String findGrade({required double mark}) {
    String grade = '';
    if (mark <= 100 && mark >= 90) {
      return grade = "A+";
    } else if (mark < 90 && mark >= 80) {
      return grade = "A";
    } else if (mark < 80 && mark >= 70) {
      return grade = "B+";
    } else if (mark < 70 && mark >= 60) {
      return grade = "B";
    } else if (mark < 60 && mark >= 50) {
      return grade = 'C';
    } else if (mark <= 40 && mark >= 0) {
      return grade = "E";
    }
    return grade;
  }

  double findPercentage({required double totalMark}) {
    double percentage = 0;
    percentage = totalMark / 600 * 100;
    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    StudentModel student = box?.getAt(widget.index);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: BuildCostomButtonWidget(
                  buttonName: "UpdateMark",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MarkSheet(
                          physics: student.physics.toString(),
                          studentClass: student.studentClass.toString(),
                          index: widget.index,
                          name: widget.name.toString(),
                          fatherName: widget.fatherName.toString(),
                          motherName: widget.motherName.toString(),
                          gender: widget.gender.toString(),
                          dateOfBirth: widget.dateOfBirth.toString(),
                          address: widget.adrress.toString(),
                          phoneNumber: widget.PhoeNumber.toString(),
                        ),
                      ),
                    );
                  }),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditStudentDetailsPage(
                      name: widget.name,
                      phoneNumber: widget.PhoeNumber,
                      motherName: widget.motherName,
                      fatherName: widget.fatherName,
                      studentClass: widget.Class,
                      addeess: widget.adrress,
                      dateOfBirth: widget.dateOfBirth,
                      index: widget.index,
                      selectedGender: widget.gender,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: BuildIconWidget(
                    color: Constants.colorList[1], icon: Icons.edit, size: 20),
              ),
            ),
          ],
          backgroundColor: Constants.colorList[0],
          title: BuildTextWidget(
            text: "Details".toUpperCase(),
            color: Constants.colorList[1],
            size: 20,
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: BuildIconWidget(
                color: Constants.colorList[1],
                icon: Icons.keyboard_arrow_left,
                size: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Constants.colorList[3],
                      child: BuildIconWidget(
                          color: Constants.colorList[1],
                          icon: Icons.add_photo_alternate_outlined,
                          size: 40),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                BuildTextWidget(
                    fontSize: FontWeight.w900,
                    text: widget.name.toUpperCase(),
                    color: Constants.colorList[2],
                    size: 20),
                const SizedBox(
                  height: 8,
                ),
                BuildTextWidget(
                    text: "+91 ${widget.PhoeNumber}",
                    color: Constants.colorList[2],
                    size: 15),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Constants.colorList[1],
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 100,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),

                  width: screenHeight(context, dividedBy: 2),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: screenWidth(
                          context,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: screenWidth(context, dividedBy: 3.1),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: BuildTextWidget(
                                  text: "Father's Name",
                                  color: Constants.colorList[2],
                                  size: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth(context, dividedBy: 23),
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
                                text: widget.fatherName.toUpperCase(),
                                color: Constants.colorList[2],
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: screenWidth(
                          context,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: screenWidth(context, dividedBy: 3.2),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: BuildTextWidget(
                                  text: "Mother Name",
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
                                text: widget.motherName.toUpperCase(),
                                color: Constants.colorList[2],
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: screenWidth(context, dividedBy: 3.2),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: BuildTextWidget(
                                text: "Class",
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
                              text: widget.Class,
                              color: Constants.colorList[2],
                              size: 15,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: screenWidth(context, dividedBy: 3.2),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: BuildTextWidget(
                                text: "Gender",
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
                              text: widget.gender,
                              color: Constants.colorList[2],
                              size: 15,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: screenWidth(context, dividedBy: 3.2),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: BuildTextWidget(
                                text: "Date of Birth",
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
                              text: widget.dateOfBirth.toUpperCase(),
                              color: Constants.colorList[2],
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: screenWidth(context, dividedBy: 3.2),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: BuildTextWidget(
                                text: "Address".toUpperCase(),
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
                              text: widget.adrress,
                              color: Constants.colorList[2],
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )

                      // Ro
                    ],
                  ),
                  // color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
                ),
                student.biology != "0" &&
                        student.physics != "0" &&
                        student.chemistry != "0" &&
                        student.socialScience != "0" &&
                        student.mathematics != "0" &&
                        student.english != "0"
                    ? Container(
                        height: screenHeight(context, dividedBy: 2),
                        width: screenWidth(context, dividedBy: 1.09),
                        decoration: BoxDecoration(
                          color: Constants.colorList[1],
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 100,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const BuildDetailsBoxWidget(
                                grade: "",
                                fontSize: FontWeight.w900,
                                subject: "SUBJECT",
                                marks: "MARKS"),
                            const SizedBox(
                              height: 10,
                            ),
                            BuildDetailsBoxWidget(
                              grade: findGrade(
                                      mark: double.parse(
                                          widget.mathematics.toString()))
                                  .toString()
                                  .toString(),
                              fontSize: FontWeight.w500,
                              subject: "Mathematics",
                              marks: widget.mathematics.toString(),
                            ),
                            BuildDetailsBoxWidget(
                              grade: findGrade(
                                  mark: double.parse(
                                      widget.socialScience.toString())),
                              fontSize: FontWeight.w500,
                              subject: "Social Science",
                              marks: widget.socialScience.toString(),
                            ),
                            BuildDetailsBoxWidget(
                              grade: findGrade(
                                  mark:
                                      double.parse(widget.biology.toString())),
                              fontSize: FontWeight.w500,
                              subject: "Biology",
                              marks: widget.biology.toString(),
                            ),
                            BuildDetailsBoxWidget(
                              grade: findGrade(
                                  mark: double.parse(
                                      widget.chemistry.toString())),
                              fontSize: FontWeight.w500,
                              subject: "Chemistry",
                              marks: widget.chemistry.toString(),
                            ),
                            BuildDetailsBoxWidget(
                                grade: findGrade(
                                    mark: double.parse(
                                        widget.physics.toString())),
                                fontSize: FontWeight.w500,
                                subject: "Physics",
                                marks: widget.physics.toString()),
                            BuildDetailsBoxWidget(
                              grade: findGrade(
                                  mark:
                                      double.parse(widget.english.toString())),
                              fontSize: FontWeight.w500,
                              subject: "English",
                              marks: widget.english.toString(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BuildDetailsBoxWidget(
                              grade: "",
                              fontSize: FontWeight.w700,
                              subject: "Total",
                              marks: totalMark.toString(),
                            ),
                            BuildDetailsBoxWidget(
                                grade: findGrade(
                                    mark: double.parse(percentage.toString())),
                                fontSize: FontWeight.w700,
                                subject: "Percentage",
                                marks: "${percentage.toStringAsFixed(0)}%"),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
