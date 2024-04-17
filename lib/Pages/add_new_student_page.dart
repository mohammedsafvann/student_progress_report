import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:progress_report/Pages/student_model.dart';
import 'package:progress_report/Pages/students_list.dart';
import 'package:progress_report/Widgets/build_circle_avatar_widget.dart';
import 'package:progress_report/Widgets/build_custom_button_widget.dart';

import 'package:progress_report/Widgets/build_drop_down_button_for_student_gender_widget.dart';
import 'package:progress_report/Widgets/build_icons_widget.dart';
import 'package:progress_report/Widgets/build_student_mark_widget.dart';
import 'package:progress_report/Widgets/build_text_widget.dart';
import 'package:progress_report/Widgets/build_text_formfield_widget.dart';
import 'package:progress_report/main.dart';
import 'package:progress_report/services/utils.dart';

import '../services/constants.dart';

class AddNewStudent extends StatefulWidget {
  const AddNewStudent({super.key});

  @override
  State<AddNewStudent> createState() => _AddNewStudentState();
}

class _AddNewStudentState extends State<AddNewStudent> {
  File? _image;

  final picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  String selectedValue = '';
  Future getImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 100,
        maxHeight: 40,
        preferredCameraDevice: CameraDevice.rear);
    setState(() {
      _image = File(pickedFile!.path);

      print('mmmmmmm');
    });
  }

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController fatherNameTextEditingController =
      TextEditingController();
  TextEditingController classTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();

  TextEditingController studentClass = TextEditingController();
  TextEditingController motherNameTextEditingController =
      TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    // calenderTextEditingController.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: BuildIconWidget(
                  color: Constants.colorList[1],
                  icon: Icons.keyboard_arrow_left,
                  size: 25),
            ),
            centerTitle: false,
            title: BuildTextWidget(
                text: 'Add new student'.toUpperCase(),
                color: Constants.colorList[1],
                size: 20),
            backgroundColor: Constants.colorList[0]),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 10),
                InkWell(
                  onTap: getImage,
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.colorList[3],
                      ),
                      // color: Constants.colorList[3],
                      child: _image == null
                          ? Icon(
                              size: 30,
                              Icons.add_photo_alternate_outlined,
                              color: Constants.colorList[1],
                            )
                          : Image.file(
                              _image!,
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                              filterQuality: FilterQuality.high,
                            )),
                ),
                const SizedBox(height: 10),
                BuildTextWidget(
                    text: "Add your photo",
                    color: Constants.colorList[2],
                    size: 15),
                const SizedBox(height: 10),
                BuildTextFieldWidget(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your name ";
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
                          gender: const ["MALE", "FEMALE"],
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
                          validator: (value) {
                            if (dateOfBirthController.text.isEmpty) {
                              return "Enter your date of birth";
                            }
                            return null;
                          },
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
                  height: 10,
                ),
                const SizedBox(
                  height: 5,
                ),
                BuildTextFieldWidget(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your class";
                    }
                    return null;
                  },
                  readOnly: false,
                  isVisible: false,
                  hintText: 'Class',
                  textEditingController: studentClass,
                ),
                const SizedBox(
                  height: 5,
                ),
                BuildTextFieldWidget(
                  validator: (value) {
                    if (phoneNumberTextEditingController.text.isEmpty) {
                      return "Enter your phone number";
                    } else if (value?.length != 10) {
                      return "Enter your 10 digit number";
                    }
                    return null;
                  },
                  keyboard: TextInputType.number,
                  readOnly: false,
                  isVisible: false,
                  hintText: 'phone number',
                  textEditingController: phoneNumberTextEditingController,
                ),
                const SizedBox(height: 10),
                BuildTextFieldWidget(
                  validator: (value) {
                    if (value!.isEmpty) {
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
                    if (value!.isEmpty) {
                      return "Enter your mother";
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
                    if (value!.isEmpty) {
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
                    Column(
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
                              InkWell(
                                onTap: getImage,
                                child: _image == null
                                    ? BuildIconWidget(
                                        color: Constants.colorList[1],
                                        icon: Icons.image,
                                        size: 50,
                                      )
                                    : Image.file(
                                        _image!,
                                        width: 160,
                                        height: 155,
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: BuildTextWidget(
                              // text: 'upload your ahar',
                              text: 'Adar Front Side',
                              color: Constants.colorList[2],
                              size: 10,
                              fontSize: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Constants.colorList[3]),
                          width: screenWidth(context, dividedBy: 2.2),
                          height: screenHeight(context, dividedBy: 4),
                          child: InkWell(
                            onTap: getImage,
                            child: _image == null
                                ? BuildIconWidget(
                                    color: Constants.colorList[1],
                                    icon: Icons.image,
                                    size: 50,
                                  )
                                : Image.file(
                                    fit: BoxFit.fill,
                                    _image!,
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: BuildTextWidget(
                            text: "Adar Back Side ",
                            color: Constants.colorList[2],
                            size: 10,
                            fontSize: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BuildCostomButtonWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print("selectedValue");
                      print(selectedValue);
                      // String id = UniqueKey().toString();
                      // box?.put(id, value);
                      box?.add(
                        StudentModel(
                            name: nameTextEditingController.text,
                            dateOfBirth: dateOfBirthController.text,
                            phoneNumber: phoneNumberTextEditingController.text,
                            motherName: motherNameTextEditingController.text,
                            fatherName: fatherNameTextEditingController.text,
                            gender: selectedValue,
                            studentClass: studentClass.text,
                            physics: "0",
                            mathematics: "0",
                            english: "0",
                            chemistry: "0",
                            biology: "0",
                            socialScience: "0",
                            addres: addressTextEditingController.text),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StudentList(),
                        ),
                      );
                    }
                  },
                  buttonName: 'submit',
                  radius: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
