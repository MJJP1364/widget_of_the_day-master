import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello Javad'),
        ),
        body: const MyPage(),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  RangeValues myValues = const RangeValues(0.0, 100.0);
  RangeLabels myLables = const RangeLabels('0', '100');
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Text(
          //   myValues.toString(),
          // ),
          ///-------------------------------------------------------Site: morioh.com---------------------------------------
          const SizedBox(
            height: 50,
          ),
          RangeSlider(
            labels: myLables,
            divisions: 10,
            min: 0,
            max: 100,
            values: myValues,
            onChanged: (RangeValues valuse) {
              myLables = RangeLabels(
                ' ${valuse.start.toInt().toString()}\$',
                ' ${valuse.end.toInt().toString()}\$',
              );
              setState(
                () {
                  myValues = valuse;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
