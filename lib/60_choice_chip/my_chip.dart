import 'package:flutter/material.dart';

class MyChip extends StatefulWidget {
  const MyChip({Key? key}) : super(key: key);

  @override
  State<MyChip> createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  bool _selected = false;
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chip Types')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              spacing: 8.0,
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue.shade900,
                    child: const Text('AB'),
                  ),
                  label: const Text('Chip'),
                ),
                InputChip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.red.shade900,
                    child: const Text('CD'),
                  ),
                  label: const Text('Input Chip'),
                  onPressed: () {
                    print('Input chip pressed');
                  },
                ),
                ChoiceChip(
                  avatar: const Icon(Icons.check),
                  label: const Text('Choice Chip'),
                  selected: _selected,
                  onSelected: (bool selected) {
                    setState(() {
                      _selected = !_selected;
                    });
                  },
                ),
                FilterChip(
                  avatar: const Icon(Icons.filter_alt),
                  label: const Text('Filter Chip'),
                  selected: _selected,
                  onSelected: (bool selected) {
                    _selected = !_selected;

                    print('Filter chip selected: $selected');
                  },
                ),
                ActionChip(
                  avatar: const Icon(Icons.directions_run),
                  label: const Text('Action Chip'),
                  onPressed: () {
                    print('Action chip pressed');
                    setState(() {
                      _value = 0;
                      _selected = false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(indent: 20, endIndent: 20, thickness: 2),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: ChoiceChip(
                    selectedColor: Colors.green,
                    backgroundColor: Colors.blue,
                    label: Text('Item $index'),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                      });
                    },
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
