import 'package:database_performance_measure/entity/person.dart';
import 'package:hive/hive.dart';

part 'hive_person.g.dart';

@HiveType(typeId: 1)
class HivePerson extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  int age;
  @HiveField(2)
  int salary;
  @HiveField(3)
  bool isFemale;
  @HiveField(4)
  bool maritalStatus;
  @HiveField(5)
  String name;
  @HiveField(6)
  String nickName;
  @HiveField(7)
  String job;
  @HiveField(8)
  String nationality;
  @HiveField(9)
  String testField1;
  @HiveField(10)
  String testField2;
  @HiveField(11)
  String testField3;
  @HiveField(12)
  String testField4;
  @HiveField(13)
  String testField5;

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
