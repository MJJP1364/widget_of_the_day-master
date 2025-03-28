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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              shadowColor: Colors.black54,
              elevation: 8,
              side: const BorderSide(color: Colors.red, width: 1.5),
            ),
            onPressed: () {},
            child: const Text('Text Button'),
          ),
          const SizedBox(
            height: 15,
          ),
          Ink(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.access_alarm,
              ),
              iconSize: 60,
              splashRadius: 35,
              splashColor: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 10,
              backgroundColor: Colors.red,
            ),
            onPressed: () {},
            child: const Text('Elevated Button'),
          ),
        ],
      ),
    );
  }
}
