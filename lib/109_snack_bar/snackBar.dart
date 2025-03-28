import 'package:flutter/material.dart';

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
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  onVisible: () {
                    print('***********');
                  },
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  duration: const Duration(seconds: 5),
                  padding: const EdgeInsets.all(10),
                  behavior: SnackBarBehavior.floating,
                  elevation: 20,
                  // width: 250,
                  margin: const EdgeInsets.all(10),
                  action: SnackBarAction(
                    label: 'SnackBar',
                    onPressed: () {
                      print('Action');
                    },
                  ),
                  content: const Text('hello javad'),
                ),
              );
            },
            child: const Text('Show SnackBar'),
          ),
        ],
      ),
    );
  }
}
