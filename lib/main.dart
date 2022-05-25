// ignore_for_file: avoid_print

import 'package:database_performance_measure/entity/person.dart';
import 'package:database_performance_measure/floor/floor_page.dart';
import 'package:database_performance_measure/hive/hive_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

final List<Person> testDataList = [];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
      home: const MyHomePage(title: 'Database Performance Measure'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = "";
  bool isInit = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      initDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Visibility(
                  visible: !isInit,
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
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                getItemWidget(
                  Colors.redAccent,
                  Colors.black87,
                  "Floor",
                  () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const FloorPage(),
                      ),
                    );
                  },
                ),
                getItemWidget(
                  Colors.deepOrangeAccent,
                  Colors.black87,
                  "Hive",
                  () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const HivePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getItemWidget(
      Color backgroundColor, Color fontColor, String title, GestureTapCallback onTap) {
    return InkWell(
      onTap: () {
        if (!isInit) {
          EasyLoading.showToast("데이터설정중입니다.");
          return;
        }

        onTap.call();
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        title: Text(
          title,
          style: TextStyle(
            color: fontColor,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
        tileColor: backgroundColor,
      ),
    );
  }

  initDatabase() async {
    setState(() {
      message = "테스트용 데이터를 설정중입니다.";
    });
    print("데이터 설정중..");

    final list = await compute(makeData, 10000);
    testDataList.addAll(list);

    isInit = true;
    setState(() {
      message = "테스트용 데이터를 설정완료.";
    });
    print("데이터 설정완료");
  }

  static makeData(int testDataCount) {
    final List<Person> list = [];
    for (int i = 1; i <= testDataCount; i++) {
      list.add(makePerson(i));
    }

    return list;
  }
}
