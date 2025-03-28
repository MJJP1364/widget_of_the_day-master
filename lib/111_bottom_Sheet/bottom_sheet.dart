import 'package:flutter/material.dart';

// site : material.io.com

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello Javad'),
        ),
        bottomSheet: Container(
          color: Colors.black26,
          height: 100,
          alignment: Alignment.center,
          child: const Text(
            'Nabegheha.com',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: const MyPage1(),
      ),
    );
  }
}

class MyPage1 extends StatefulWidget {
  const MyPage1({Key? key}) : super(key: key);

  @override
  State<MyPage1> createState() => _MyPage1State();
}

class _MyPage1State extends State<MyPage1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: true,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 100,
                    color: Colors.red.withOpacity(0.5),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Hello Javad'),
                        Text('Hello Javad'),
                        Text('Hello Javad'),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text('Click Me'),
          ),
        ],
      ),
    );
  }
}
