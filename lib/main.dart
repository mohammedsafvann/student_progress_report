import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:progress_report/Pages/student_model.dart';

import 'package:progress_report/Pages/students_list.dart';
import 'package:progress_report/Widgets/build_drop_down_button_for_student_gender_widget.dart';
import 'package:progress_report/Widgets/build_text_formfield_widget.dart';

import 'Pages/students_details.dart';

import 'Widgets/build_student_mark_widget.dart';

//
// void main() {
//   runApp(const MyApp());
// }
Box? box;

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());
  box = await Hive.openBox<StudentModel>('Student');
  // box = Hive.box<StudentModel>('Student');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StudentList(),
    );
  }
}
