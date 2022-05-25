import 'package:database_performance_measure/utils/string_utils.dart';

class Person {
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

  Person(
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

Person makePerson(int id) {
  return Person(
    id,
    age: rnd.nextInt(99),
    salary: rnd.nextInt(99999999),
    isFemale: rnd.nextBool(),
    maritalStatus: rnd.nextBool(),
    name: getRandomString(10),
    nickName: getRandomString(10),
    job: getRandomString(6),
    nationality: getRandomString(20),
    testField1: getRandomString(100),
    testField2: getRandomString(500),
    testField3: getRandomString(1000),
    testField4: getRandomString(1500),
    testField5: getRandomString(2000),
  );
}
