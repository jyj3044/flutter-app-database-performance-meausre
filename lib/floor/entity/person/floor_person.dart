import 'package:database_performance_measure/entity/person.dart';
import 'package:floor/floor.dart';

@entity
class FloorPerson {
  @primaryKey
  int id;
  int age;
  int salary;
  bool isFemale;
  bool maritalStatus;
  String name;
  String nickName;
  String job;
  String nationality;
  String testField1;
  String testField2;
  String testField3;
  String testField4;
  String testField5;

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

  @override
  String toString() {
    return 'FloorPerson{id: $id, age: $age, salary: $salary, isFemale: $isFemale, maritalStatus: $maritalStatus, name: $name, nickName: $nickName, job: $job, nationality: $nationality, testField1: $testField1, testField2: $testField2, testField3: $testField3, testField4: $testField4, testField5: $testField5}';
  }
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
