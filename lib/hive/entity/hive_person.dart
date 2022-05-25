import 'package:database_performance_measure/entity/person.dart';
import 'package:hive/hive.dart';

part 'hive_person.g.dart';

@HiveType(typeId: 1)
class HivePerson {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int age;
  @HiveField(2)
  final int salary;
  @HiveField(3)
  final bool isFemale;
  @HiveField(4)
  final bool maritalStatus;
  @HiveField(5)
  final String name;
  @HiveField(6)
  final String nickName;
  @HiveField(7)
  final String job;
  @HiveField(8)
  final String nationality;
  @HiveField(9)
  final String testField1;
  @HiveField(10)
  final String testField2;
  @HiveField(11)
  final String testField3;
  @HiveField(12)
  final String testField4;
  @HiveField(13)
  final String testField5;

  HivePerson(
    this.id, {
    this.age = 0,
    this.salary = 0,
    this.isFemale = false,
    this.maritalStatus = false,
    this.name = "",
    this.nickName = "",
    this.job = "",
    this.nationality = "",
    this.testField1 = "",
    this.testField2 = "",
    this.testField3 = "",
    this.testField4 = "",
    this.testField5 = "",
  });

  HivePerson copyHivePerson({
    age,
    salary,
    isFemale,
    maritalStatus,
    name,
    nickName,
    job,
    nationality,
    testField1,
    testField2,
    testField3,
    testField4,
    testField5,
  }) {
    return HivePerson(
      id,
      age: age ?? this.age,
      salary: salary ?? this.salary,
      isFemale: isFemale ?? this.isFemale,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      name: name ?? this.name,
      nickName: nickName ?? this.nickName,
      job: job ?? this.job,
      nationality: nationality ?? this.nationality,
      testField1: testField1 ?? this.testField1,
      testField2: testField2 ?? this.testField2,
      testField3: testField3 ?? this.testField3,
      testField4: testField4 ?? this.testField4,
      testField5: testField5 ?? this.testField5,
    );
  }

  @override
  String toString() {
    return 'HivePerson{id: $id, age: $age, salary: $salary, isFemale: $isFemale, maritalStatus: $maritalStatus, name: $name, nickName: $nickName, job: $job, nationality: $nationality, testField1: $testField1, testField2: $testField2, testField3: $testField3, testField4: $testField4, testField5: $testField5}';
  }
}

HivePerson makeHivePerson(Person person) {
  return HivePerson(
    person.id,
    age: person.age,
    salary: person.salary,
    isFemale: person.isFemale,
    maritalStatus: person.maritalStatus,
    name: person.name,
    nickName: person.nickName,
    job: person.job,
    nationality: person.nationality,
    testField1: person.testField1,
    testField2: person.testField2,
    testField3: person.testField3,
    testField4: person.testField4,
    testField5: person.testField5,
  );
}
