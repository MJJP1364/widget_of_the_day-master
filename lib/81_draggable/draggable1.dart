import 'package:flutter/material.dart';

class MyDraggable1 extends StatefulWidget {
  const MyDraggable1({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyDraggable1State createState() => _MyDraggable1State();
}

class _MyDraggable1State extends State<MyDraggable1> {
  Color _draggedColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Draggable<Color>(
              data: Colors.deepPurple,
              feedback: Container(
                width: 100,
                height: 100,
                color: Colors.deepPurple.withOpacity(0.5),
              ),
              childWhenDragging: Container(
                width: 100,
                height: 100,
                color: Colors.grey,
                child: const Center(
                  child: Text('Dragging...',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.deepPurple,
                child: const Center(
                  child: Text('Drag me', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 50),
            DragTarget<Color>(
              onWillAccept: (color) {
                // if (color == Colors.red) {
                if (color == Colors.deepPurple) {
                  return true;
                } else {
                  return false;
                }
              },
              onAccept: (color) {
                setState(() {
                  _draggedColor = color;
                });
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 100,
                  height: 100,
                  color: _draggedColor,
                  child: const Center(
                    child: Text('Drop here',
                        style: TextStyle(color: Colors.white)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
