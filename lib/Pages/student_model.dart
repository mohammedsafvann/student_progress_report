import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? phoneNumber;
  @HiveField(2)
  final String? fatherName;
  @HiveField(3)
  final String? motherName;
  @HiveField(4)
  final String? studentClass;
  @HiveField(5)
  final String? gender;
  @HiveField(6)
  final String? dateOfBirth;
  @HiveField(7)
  final String? addres;
  @HiveField(8)
  final String? chemistry;
  @HiveField(9)
  final String? physics;
  @HiveField(10)
  final String? biology;
  @HiveField(11)
  final String? english;
  @HiveField(12)
  final String? socialScience;
  @HiveField(13)
  final String? mathematics;

  StudentModel({
    this.chemistry,
    this.physics,
    this.biology,
    this.english,
    this.socialScience,
    this.mathematics,
    this.name,
    this.dateOfBirth,
    this.phoneNumber,
    this.motherName,
    this.fatherName,
    this.gender,
    this.studentClass,
    this.addres,
  });
}
