import 'dart:async';

import 'package:database_performance_measure/floor/entity/person/floor_person.dart';
import 'package:database_performance_measure/floor/entity/person/person_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [FloorPerson])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}