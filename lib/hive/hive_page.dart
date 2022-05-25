// ignore_for_file: avoid_print

import 'package:database_performance_measure/entity/person.dart';
import 'package:database_performance_measure/hive/entity/hive_person.dart';
import 'package:database_performance_measure/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _title = "Hive";
const _boxName = "person_box";

class HivePage extends StatefulWidget {
  const HivePage({Key? key}) : super(key: key);

  @override
  State<HivePage> createState() => _HivePageState();
}

class _HivePageState extends State<HivePage> {
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
        title: const Text("$_title Database"),
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
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(HivePersonAdapter().typeId)) {
      Hive.registerAdapter(HivePersonAdapter());
    }

    var box = await Hive.openBox<HivePerson>(_boxName);
    box.clear();

    // box.deleteFromDisk();

    /// 데이터 넣기
    await insertData(box);

    /// 전체 데이터 찾기
    final dataList = await findAllData(box);

    /// 데이터 한개찾기
    final data = await findByIdData(box);

    /// 데이터 한개 수정하기
    await updateData(box, data!);

    /// 데이터 리스트 수정하기
    await updateListData(box, dataList);

    /// 데이터 전체 지우기
    await deleteAllData(box);

    if (!mounted) return;
    setState(() {
      int allTime =
          insertTime + updateTime + updateListTime + deleteAllTime + findAllTime + findByIdTime;
      statusMessage = "총 누적시간: ${allTime}ms";
    });
  }

  insertData(Box<HivePerson> box) async {
    if (!mounted) return;

    setState(() {
      print("Hive 데이터 넣기 시작");
      statusMessage = "데이터 넣는중...";
    });

    final stopwatch = Stopwatch()..start();
    for (Person person in testDataList) {
      box.add(makeHivePerson(person));
    }
    if (!mounted) return;

    setState(() {
      insertTime = stopwatch.elapsed.inMilliseconds;
      print("Hive 데이터 넣기 종료");
    });
  }

  Future<List<HivePerson>> findAllData(Box<HivePerson> box) async {
    if (!mounted) return [];

    setState(() {
      print("$_title 데이터 전체 찾기 시작");
      statusMessage = "데이터 전체 찾는중...";
    });

    final stopwatch = Stopwatch()..start();
    final allData = box.values.toList();
    if (!mounted) return [];

    setState(() {
      findAllTime = stopwatch.elapsed.inMilliseconds;
      print("$_title 전체 데이터 가져오기 완료. ${allData.length}");
    });

    return allData;
  }

  Future<HivePerson?> findByIdData(Box<HivePerson> box) async {
    if (!mounted) return null;

    setState(() {
      print("$_title 데이터 찾기 시작");
      statusMessage = "데이터 1개 찾는중...";
    });

    final stopwatch = Stopwatch()..start();
    final data = box.getAt(testDataList.length ~/ 2);
    if (!mounted) return null;

    setState(() {
      findByIdTime = stopwatch.elapsed.inMilliseconds;
      print("$_title 데이터 가져오기 완료. ${data.toString()}");
    });

    return data;
  }

  updateData(Box<HivePerson> box, HivePerson data) async {
    if (!mounted) return;

    setState(() {
      print("$_title 데이터 수정 시작");
      statusMessage = "데이터 1개 수정중...";
    });

    final stopwatch = Stopwatch()..start();
    HivePerson copyHivePerson = data.copyHivePerson(nickName: "닉네임 수정");
    box.putAt(testDataList.length ~/ 2, copyHivePerson);
    if (!mounted) return;

    setState(() {
      updateTime = stopwatch.elapsed.inMilliseconds;
      print("$_title 데이터 수정 완료. ${copyHivePerson.toString()}");
    });
  }

  updateListData(Box<HivePerson> box, List<HivePerson> dataList) async {
    if (!mounted) return;

    setState(() {
      print("$_title 데이터 리스트 수정 시작");
      statusMessage = "데이터 리스트 수정중...";
    });

    final stopwatch = Stopwatch()..start();
    box.putAll(dataList.asMap());
    if (!mounted) return;

    setState(() {
      updateListTime = stopwatch.elapsed.inMilliseconds;
      print("$_title 데이터리스트 수정 완료.");
    });
  }

  deleteAllData(Box<HivePerson> box) async {
    if (!mounted) return;

    setState(() {
      print("$_title 데이터 삭제 시작");
      statusMessage = "데이터 전체 삭제중...";
    });

    final stopwatch = Stopwatch()..start();
    box.clear();
    if (!mounted) return;

    setState(() {
      deleteAllTime = stopwatch.elapsed.inMilliseconds;
      print("$_title 데이터 전체 삭제 완료.");
    });
  }
}
