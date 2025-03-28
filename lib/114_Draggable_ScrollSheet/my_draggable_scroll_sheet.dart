import 'package:flutter/material.dart';

class MyDraggableScrollSheet extends StatelessWidget {
  const MyDraggableScrollSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Scrollable Sheet')),
      body: Stack(
        children: [
          const Center(
            child: Text('Background Content'),
          ),
          DraggableScrollableSheet(
            // expand: false,
            // snap: true,
            // snapAnimationDuration: const Duration(seconds: 5),
            initialChildSize: 0.3,
            minChildSize: 0.1,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.blue[100],
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('Item $index'));
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
