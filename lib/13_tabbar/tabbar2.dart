import 'package:flutter/material.dart';

class MyTabBar1 extends StatefulWidget {
  const MyTabBar1({Key? key}) : super(key: key);

  @override
  State<MyTabBar1> createState() => _MyTabBar1State();
}

class _MyTabBar1State extends State<MyTabBar1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.cut)),
            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.cut),
          ],
        ),
      ),
    );
  }
}
