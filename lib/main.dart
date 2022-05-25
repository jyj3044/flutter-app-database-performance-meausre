import 'package:database_performance_measure/entity/person.dart';
import 'package:database_performance_measure/floor/floor_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();

    initDatabase();
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
            child: Text(
              message,
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
      onTap: onTap,
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
    message = "테스트용 데이터를 설정중입니다.";

    int testDataCount = 100000;

    for (int i = 1; i <= testDataCount; i++) {
      testDataList.add(makePerson(i));
      message = "테스트용 데이터를 설정중입니다. $i/$testDataCount";
    }

    message = "테스트용 데이터설정을 완료하였습니다.";
  }
}
