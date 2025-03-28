import 'package:flutter/material.dart';

class MyMaterialStateProperty extends StatelessWidget {
  const MyMaterialStateProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material State Property'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(95, 31, 35, 43),
      body: Center(
        child: ElevatedButton(
          style: newMethod(),
          onPressed: () {},
          child: const Text('My Button'),
        ),
      ),
    );
  }

  ButtonStyle newMethod() {
    return ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return const TextStyle(fontSize: 50);
        }
        return const TextStyle(fontSize: 20);
      }),
      padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue;
          } else if (states.contains(MaterialState.hovered)) {
            return Colors.green;
          }
          return Colors.red; // Default color
        },
      ),
    );
  }
}
