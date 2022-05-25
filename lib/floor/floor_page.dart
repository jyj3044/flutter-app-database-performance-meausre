import 'package:database_performance_measure/floor/entity/person/floor_person.dart';
import 'package:database_performance_measure/floor/floor_database.dart';
import 'package:database_performance_measure/main.dart';
import 'package:flutter/material.dart';

const databaseName = "floor.database";

class FloorPage extends StatefulWidget {
  const FloorPage({Key? key}) : super(key: key);

  @override
  State<FloorPage> createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage> {
  int deleteTime = 0;

  @override
  void initState() {
    super.initState();

    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [const Text("DELETE TIME: "), Text("$deleteTime")],
            )
          ],
        ),
      ),
    );
  }

  void initDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder(databaseName).build();
    final personDao = database.personDao;

    final list = await personDao.findAll();
    print(list.length);

    personDao.deleteAllData();

    final person = makeFloorPerson(testDataList[0]);

    await personDao.insertData(person);
    final result = personDao.findByPrimaryKey(1);

    print(result.toString());
  }
}
