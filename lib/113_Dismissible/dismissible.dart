import 'package:flutter/material.dart';

class MyDismissibleScreen extends StatefulWidget {
  const MyDismissibleScreen({Key? key}) : super(key: key);

  @override
  State<MyDismissibleScreen> createState() => _MyDismissibleScreenState();
}

class _MyDismissibleScreenState extends State<MyDismissibleScreen> {
  final List<String> items = List<String>.generate(10, (i) => 'Item ${i + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final String item = items[index];
          return Dismissible(
            resizeDuration: const Duration(milliseconds: 1000),
            // direction: DismissDirection.startToEnd,
            confirmDismiss: (DismissDirection direction) async {
              if (direction == DismissDirection.startToEnd) {
                return await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text('Do you want to delete this item?'),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        TextButton(
                          child: const Text('Delete'),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ],
                    );
                  },
                );
              } else if (direction == DismissDirection.endToStart) {
                return await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text(
                          'Do you want to add to favorit this item?'),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ],
                    );
                  },
                );
              } else {
                return null;
              }
            },
            key: Key(item),
            background: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                // padding: const EdgeInsets.all(20.0),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
            secondaryBackground: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerRight,
                // padding: const EdgeInsets.all(20.0),
                color: Colors.blue,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Favorit',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                // print('Favorit $index');
                setState(() {
                  items.removeAt(index);
                });
              } else if (direction == DismissDirection.startToEnd) {
                setState(() {
                  items.removeAt(index);
                });
              }
              // print('Dismissed $index');
            },
            child: ListTile(
              title: Text('Item $index'),
            ),
          );
        },
      ),
    );
  }
}
