// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivePersonAdapter extends TypeAdapter<HivePerson> {
  @override
  final int typeId = 1;

  @override
  HivePerson read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePerson(
      fields[0] as int,
      age: fields[1] as int,
      salary: fields[2] as int,
      isFemale: fields[3] as bool,
      maritalStatus: fields[4] as bool,
      name: fields[5] as String,
      nickName: fields[6] as String,
      job: fields[7] as String,
      nationality: fields[8] as String,
      testField1: fields[9] as String,
      testField2: fields[10] as String,
      testField3: fields[11] as String,
      testField4: fields[12] as String,
      testField5: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HivePerson obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.salary)
      ..writeByte(3)
      ..write(obj.isFemale)
      ..writeByte(4)
      ..write(obj.maritalStatus)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.nickName)
      ..writeByte(7)
      ..write(obj.job)
      ..writeByte(8)
      ..write(obj.nationality)
      ..writeByte(9)
      ..write(obj.testField1)
      ..writeByte(10)
      ..write(obj.testField2)
      ..writeByte(11)
      ..write(obj.testField3)
      ..writeByte(12)
      ..write(obj.testField4)
      ..writeByte(13)
      ..write(obj.testField5);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
