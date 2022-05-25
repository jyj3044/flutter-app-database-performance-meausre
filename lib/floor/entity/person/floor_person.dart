import 'package:database_performance_measure/entity/person.dart';
import 'package:floor/floor.dart';

@entity
class FloorPerson {
  @primaryKey
  final int id;
  final int age;
  final int salary;
  final bool isFemale;
  final bool maritalStatus;
  final String name;
  final String nickName;
  final String job;
  final String nationality;
  final String testField1;
  final String testField2;
  final String testField3;
  final String testField4;
  final String testField5;

  FloorPerson(
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
}

FloorPerson makeFloorPerson(Person person) {
  return FloorPerson(
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
