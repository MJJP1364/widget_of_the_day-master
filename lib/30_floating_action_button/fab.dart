import 'package:flutter/material.dart';

class MyFab extends StatefulWidget {
  const MyFab({Key? key}) : super(key: key);

  @override
  State<MyFab> createState() => _MyFabState();
}

class _MyFabState extends State<MyFab> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Action Button'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        mini: true,
        elevation: 10,
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.yellow,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.purple[400],
          width: double.infinity,
          height: 100,
        ),
      ),
      body: Center(
        child: Text(
          '$count',
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
