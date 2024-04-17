import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progress_report/Pages/student_model.dart';
import 'package:progress_report/Pages/students_list.dart';
import 'package:progress_report/main.dart';

import '../Widgets/build_custom_button_widget.dart';
import '../Widgets/build_drop_down_button_for_student_gender_widget.dart';
import '../Widgets/build_icons_widget.dart';
import '../Widgets/build_text_formfield_widget.dart';
import '../Widgets/build_text_widget.dart';
import '../services/constants.dart';
import '../services/utils.dart';

class EditStudentDetailsPage extends StatefulWidget {
  final String selectedGender;
  List<String>? gender;
  final int index;
  final String name;
  final String phoneNumber;
  final String motherName;
  final String fatherName;
  final String studentClass;
  final String addeess;
  final String dateOfBirth;

  EditStudentDetailsPage(
      {super.key,
      this.gender,
      required this.name,
      required this.phoneNumber,
      required this.motherName,
      required this.fatherName,
      required this.studentClass,
      required this.addeess,
      required this.dateOfBirth,
      required this.index,
      required this.selectedGender});

  @override
  State<EditStudentDetailsPage> createState() => _EditStudentDetailsPageState();
}

class _EditStudentDetailsPageState extends State<EditStudentDetailsPage> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController studentClassController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController motherNameTextEditingController =
      TextEditingController();
  TextEditingController fatherNameTextEditingController =
      TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  String? dropDownValue;
  final formKey = GlobalKey<FormState>();
  String selectedValue = '';

  @override
  void initState() {
    nameTextEditingController.text = widget.name;
    dateOfBirthController.text = widget.dateOfBirth;
    studentClassController.text = widget.studentClass;
    phoneNumberTextEditingController.text = widget.phoneNumber;
    motherNameTextEditingController.text = widget.motherName;
    fatherNameTextEditingController.text = widget.fatherName;
    addressTextEditingController.text = widget.fatherName;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StudentModel student = box?.getAt(widget.index);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: BuildIconWidget(
                color: Constants.colorList[1],
                icon: Icons.keyboard_arrow_left_outlined,
                size: 30),
          ),
          backgroundColor: Constants.colorList[0],
          title: BuildTextWidget(
              text: "Edit Details", color: Constants.colorList[1], size: 20),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Constants.colorList[3],
                    child: Icon(
                      size: 30,
                      Icons.add_photo_alternate_outlined,
                      color: Constants.colorList[1],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                BuildTextWidget(
                    text: "Add your photo",
                    color: Constants.colorList[2],
                    size: 15),
                const SizedBox(height: 10),
                BuildTextFieldWidget(
                  validator: (value) {
                    if (nameTextEditingController.text.isEmpty) {
                      return "Enter your name";
                    }
                    return null;
                  },
                  readOnly: false,
                  isVisible: false,
                  hintText: 'Name',
                  textEditingController: nameTextEditingController,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: screenWidth(context, dividedBy: 2.3),
                        child: BuildDropDownButtonForStudentGenderwidget(
                          gender: ["MALE", "Female"],
                          validation: (value) {
                            if (value.isEmpty) {
                              return "please select gender";
                            }
                            selectedValue = value;
                            print(selectedValue);

                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context, dividedBy: 1.9),
                      child: BuildTextFieldWidget(
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await datePicker(context);
                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              print(formattedDate);
                              setState(() {
                                dateOfBirthController.text = formattedDate;
                              });
                            } else {
                              print("Date is note selected");
                            }
                          },
                          isVisible: true,
                          hintText: "DOB",
                          textEditingController: dateOfBirthController),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 5,
                ),
                BuildTextFieldWidget(
                  validator: (value) {
                    if (studentClassController.text.isEmpty) {
                      return "Enter your Class";
                    }
                    return null;
                  },
                  readOnly: false,
                  isVisible: false,
                  hintText: 'Class',
                  textEditingController: studentClassController,
                ),
                const SizedBox(
                  height: 5,
                ),
                BuildTextFieldWidget(
                  keyboard: TextInputType.number,
                  readOnly: false,
                  isVisible: false,
                  hintText: 'phone number',
                  textEditingController: phoneNumberTextEditingController,
                  validator: (value) {
                    if (phoneNumberTextEditingController.text.length != 10) {
                      return "Enter your 10 digit phone number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                BuildTextFieldWidget(
                  validator: (value) {
                    if (fatherNameTextEditingController.text.isEmpty) {
                      return "Enter your father name";
                    }
                    return null;
                  },
                  readOnly: false,
                  isVisible: false,
                  hintText: 'Father Name',
                  textEditingController: fatherNameTextEditingController,
                ),
                const SizedBox(height: 10),
                BuildTextFieldWidget(
                  validator: (value) {
                    if (motherNameTextEditingController.text.isEmpty) {
                      return "Enter your mother name";
                    }
                    return null;
                  },
                  readOnly: false,
                  isVisible: false,
                  hintText: 'Mother Name',
                  textEditingController: motherNameTextEditingController,
                ),
                const SizedBox(height: 10),
                BuildTextFieldWidget(
                  validator: (value) {
                    if (addressTextEditingController.text.isEmpty) {
                      return "Enter your address";
                    }
                    return null;
                  },
                  readOnly: false,
                  isVisible: false,
                  hintText: 'Address',
                  textEditingController: addressTextEditingController,
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 10,
                ),
                BuildTextWidget(
                  fontSize: FontWeight.w500,
                  text: "---------Upload Your Adhar----------",
                  color: Constants.colorList[2],
                  size: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Constants.colorList[3]),
                      width: screenWidth(context, dividedBy: 2.2),
                      height: screenHeight(context, dividedBy: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BuildIconWidget(
                            color: Constants.colorList[1],
                            icon: Icons.image,
                            size: 40,
                          ),
                          BuildTextWidget(
                              // text: 'upload your ahar',
                              text: 'Adhar Front Side',
                              color: Constants.colorList[2],
                              size: 8)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Constants.colorList[3],
                      ),
                      width: screenWidth(context, dividedBy: 2.2),
                      height: screenHeight(context, dividedBy: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BuildIconWidget(
                            color: Constants.colorList[1],
                            icon: Icons.image,
                            size: 40,
                          ),
                          BuildTextWidget(
                              // text: 'upload your ahar',
                              text: 'Adhar Back Side',
                              color: Constants.colorList[2],
                              size: 8)
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BuildCostomButtonWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      box?.putAt(
                        widget.index,
                        StudentModel(
                            socialScience: student.socialScience,
                            biology: student.biology,
                            chemistry: student.chemistry,
                            english: student.english,
                            mathematics: student.mathematics,
                            physics: student.physics,
                            name: nameTextEditingController.text,
                            dateOfBirth: dateOfBirthController.text,
                            phoneNumber: phoneNumberTextEditingController.text,
                            motherName: motherNameTextEditingController.text,
                            fatherName: fatherNameTextEditingController.text,
                            gender: selectedValue.toString(),
                            studentClass: studentClassController.text,
                            addres: addressTextEditingController.text),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentList(),
                        ),
                      );
                    }
                  },
                  buttonName: 'submit',
                  radius: 10,
                ),
                //  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
