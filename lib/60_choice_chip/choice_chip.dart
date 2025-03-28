import 'package:flutter/material.dart';
import 'package:widget_of_the_day/60_choice_chip/my_chip.dart';

class MyChoiceChip extends StatefulWidget {
  const MyChoiceChip({Key? key}) : super(key: key);

  @override
  State<MyChoiceChip> createState() => _MyChoiceChipState();
}

class _MyChoiceChipState extends State<MyChoiceChip> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choice Chip')),
      body: Center(
        child: ChoiceChip(
          avatar: const Icon(Icons.ac_unit),
          label: const Text('Choice Chip'),
          selected: _isSelected,
          onSelected: (newBoolValue) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyChip(),
              ),
            );
            setState(() {
              _isSelected = newBoolValue;
            });
          },
        ),
      ),
    );
  }
}
