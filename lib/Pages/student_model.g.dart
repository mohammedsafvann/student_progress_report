// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 0;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      chemistry: fields[8] as String?,
      physics: fields[9] as String?,
      biology: fields[10] as String?,
      english: fields[11] as String?,
      socialScience: fields[12] as String?,
      mathematics: fields[13] as String?,
      name: fields[0] as String?,
      dateOfBirth: fields[6] as String?,
      phoneNumber: fields[1] as String?,
      motherName: fields[3] as String?,
      fatherName: fields[2] as String?,
      gender: fields[5] as String?,
      studentClass: fields[4] as String?,
      addres: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.fatherName)
      ..writeByte(3)
      ..write(obj.motherName)
      ..writeByte(4)
      ..write(obj.studentClass)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.dateOfBirth)
      ..writeByte(7)
      ..write(obj.addres)
      ..writeByte(8)
      ..write(obj.chemistry)
      ..writeByte(9)
      ..write(obj.physics)
      ..writeByte(10)
      ..write(obj.biology)
      ..writeByte(11)
      ..write(obj.english)
      ..writeByte(12)
      ..write(obj.socialScience)
      ..writeByte(13)
      ..write(obj.mathematics);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
