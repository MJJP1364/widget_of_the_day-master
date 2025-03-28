import 'package:flutter/material.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialBanner'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Show Banner'),
          onPressed: () {
            ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                backgroundColor: Colors.black26,
                padding: const EdgeInsets.all(10),
                content: const Text('This is a MaterialBanner'),
                actions: [
                  TextButton(
                    child: const Text('DISMISS'),
                    onPressed: () => ScaffoldMessenger.of(context)
                        .hideCurrentMaterialBanner(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
