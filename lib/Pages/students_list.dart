import 'package:flutter/material.dart';
import 'package:progress_report/Pages/student_model.dart';
import 'package:progress_report/Pages/students_details.dart';
import 'package:progress_report/Widgets/build_icons_widget.dart';
import 'package:progress_report/Widgets/build_student_register_widget.dart';
import 'package:progress_report/Widgets/build_text_widget.dart';
import 'package:progress_report/main.dart';
import 'package:progress_report/services/utils.dart';

import '../services/constants.dart';
import 'add_new_student_page.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerMobile = TextEditingController();
  @override
  initState() {
    // getTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Constants.colorList[0],
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewStudent(),
                )),
            child: BuildIconWidget(
                color: Constants.colorList[1], icon: Icons.add, size: 35),
          ),
          onPressed: () {},
        ),
        // backgroundColor: Colors.yellow,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            centerTitle: true,
            title: BuildTextWidget(
                text: " STUDENTS",
                color: Constants.colorList[1],
                size: 25,
                fontSize: FontWeight.w600),
            backgroundColor: Constants.colorList[0],
          ),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              color: Constants.colorList[1],
              height: MediaQuery.of(context).size.height,
              width: screenWidth(context, dividedBy: 1),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 5),
                itemCount: box!.length,
                itemBuilder: (context, index) {
                  print(box!.length);
                  StudentModel student = box?.getAt(index);

                  return InkWell(
                    onTap: () {
                      print('student.biology');
                      print(student.biology);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentDetails(
                              biology: double.parse(student.biology!),
                              chemistry: double.parse(student.chemistry!),
                              english: double.parse(student.english!),
                              socialScience:
                                  double.parse(student.socialScience!),
                              mathematics: double.parse(student.mathematics!),
                              physics: double.parse(student.physics!),
                              dateOfBirth: student.dateOfBirth.toString(),
                              gender: student.gender.toString(),
                              name: student.name.toString(),
                              adrress: student.addres.toString(),
                              Class: student.studentClass.toString(),
                              fatherName: student.fatherName.toString(),
                              motherName: student.motherName.toString(),
                              PhoeNumber: student.phoneNumber.toString(),
                              index: index,
                            ),
                          ));
                    },
                    child: BuildStudentRegisterWidget(
                      index: index,
                      dateOfBirth: student.dateOfBirth.toString(),
                      number: index + 1,
                      name: student.name.toString(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        backgroundColor: Constants.colorList[1],
      ),
    );
  }
}
