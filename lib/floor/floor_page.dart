// ignore_for_file: avoid_print

import 'package:database_performance_measure/entity/person.dart';
import 'package:database_performance_measure/floor/entity/person/floor_person.dart';
import 'package:database_performance_measure/floor/entity/person/person_dao.dart';
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
  String statusMessage = "";
  int insertTime = -1;
  int findAllTime = -1;
  int findByIdTime = -1;
  int updateTime = -1;
  int updateListTime = -1;
  int deleteAllTime = -1;

  @override
  void initState() {
    super.initState();

    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floor Database"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                statusMessage,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            getTextWidget("TEST DATA SIZE: ", "${testDataList.length}개", 0),
            getTextWidget("INSERT TIME: ", "${insertTime}ms", insertTime),
            getTextWidget("FIND ALL TIME: ", "${findAllTime}ms", findAllTime),
            getTextWidget("FIND BY ID TIME: ", "${findByIdTime}ms", findByIdTime),
            getTextWidget("UPDATE TIME: ", "${updateTime}ms", updateTime),
            getTextWidget("UPDATE LIST TIME: ", "${updateListTime}ms", updateListTime),
            getTextWidget("DELETE ALL TIME: ", "${deleteAllTime}ms", deleteAllTime),
          ],
        ),
      ),
    );
  }

  Widget getTextWidget(String title, String timeStr, int time) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Visibility(
            visible: time >= 0,
            child: Text(
              timeStr,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Visibility(
            visible: time == -1,
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void initDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder(databaseName).build();
    final personDao = database.personDao;
    await personDao.deleteAllData();

    /// 데이터 넣기
    await insertData(personDao);

    /// 전체 데이터 찾기
    final dataList = await findAllData(personDao);

    /// 데이터 한개찾기
    final data = await findByIdData(personDao);

    /// 데이터 한개 수정하기
    await updateData(personDao, data!);

    /// 데이터 리스트 수정하기
    await updateListData(personDao, dataList);

    /// 데이터 전체 지우기
    await deleteAllData(personDao);

    if (!mounted) return;
    setState(() {
      int allTime =
          insertTime + updateTime + updateListTime + deleteAllTime + findAllTime + findByIdTime;
      statusMessage = "총 누적시간: ${allTime}ms";
    });
  }

  insertData(PersonDao personDao) async {
    if (!mounted) return;

    setState(() {
      print("Floor 데이터 넣기 시작");
      statusMessage = "데이터 넣는중...";
    });

    final stopwatch = Stopwatch()..start();
    for (Person person in testDataList) {
      await personDao.insertData(makeFloorPerson(person));
    }
    if (!mounted) return;

    setState(() {
      insertTime = stopwatch.elapsed.inMilliseconds;
      print("Floor 데이터 넣기 종료");
    });
  }

  Future<List<FloorPerson>> findAllData(PersonDao personDao) async {
    if (!mounted) return [];

    setState(() {
      print("Floor 데이터 전체 찾기 시작");
      statusMessage = "데이터 전체 찾는중...";
    });

    final stopwatch = Stopwatch()..start();
    final allData = await personDao.findAll();
    if (!mounted) return [];

    setState(() {
      findAllTime = stopwatch.elapsed.inMilliseconds;
      print("Floor 전체 데이터 가져오기 완료. ${allData.length}");
    });

    return allData;
  }

  Future<FloorPerson?> findByIdData(PersonDao personDao) async {
    if (!mounted) return null;

    setState(() {
      print("Floor 데이터 찾기 시작");
      statusMessage = "데이터 1개 찾는중...";
    });

    final stopwatch = Stopwatch()..start();
    final data = await personDao.findByPrimaryKey(testDataList.length ~/ 2);
    if (!mounted) return null;

    setState(() {
      findByIdTime = stopwatch.elapsed.inMilliseconds;
      print("Floor 데이터 가져오기 완료. ${data.toString()}");
    });

    return data;
  }

  updateData(PersonDao personDao, FloorPerson data) async {
    if (!mounted) return;

    setState(() {
      print("Floor 데이터 수정 시작");
      statusMessage = "데이터 1개 수정중...";
    });

    final stopwatch = Stopwatch()..start();
    await personDao.updateData(data);
    if (!mounted) return;

    setState(() {
      updateTime = stopwatch.elapsed.inMilliseconds;
      print("Floor 데이터 수정 완료.");
    });
  }

  updateListData(PersonDao personDao, List<FloorPerson> dataList) async {
    if (!mounted) return;

    setState(() {
      print("Floor 데이터 리스트 수정 시작");
      statusMessage = "데이터 리스트 수정중...";
    });

    final stopwatch = Stopwatch()..start();
    await personDao.updateDataList(dataList);
    if (!mounted) return;

    setState(() {
      updateListTime = stopwatch.elapsed.inMilliseconds;
      print("Floor 데이터리스트 수정 완료.");
    });
  }

  deleteAllData(PersonDao personDao) async {
    if (!mounted) return;

    setState(() {
      print("Floor 데이터 삭제 시작");
      statusMessage = "데이터 전체 삭제중...";
    });

    final stopwatch = Stopwatch()..start();
    await personDao.deleteAllData();
    if (!mounted) return;

    setState(() {
      deleteAllTime = stopwatch.elapsed.inMilliseconds;
      print("Floor 데이터 전체 삭제 완료.");
    });
  }
}
