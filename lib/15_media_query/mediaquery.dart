import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyMediaQuery extends StatelessWidget {
  const MyMediaQuery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Media Query"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Height: ${MediaQuery.of(context).size.height}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Width: ${MediaQuery.of(context).size.width}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Aspect Ratio: ${MediaQuery.of(context).size.aspectRatio.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24),
            ),
            // for orientation
            Text(
              "Orientation: ${MediaQuery.of(context).orientation}",
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
