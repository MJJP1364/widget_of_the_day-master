import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
  final List<String> _name = ['mahsa', 'javad', 'roham'];
  String res = 'mahsa';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DropdownButton<String>(
            iconSize: 60,
            items: _name.map((String dropdownMenuItem) {
              return DropdownMenuItem<String>(
                value: dropdownMenuItem,
                child: Text(dropdownMenuItem),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                res = value!;
              });
            },
            value: res,
          ),
        ],
      ),
    );
  }
}
