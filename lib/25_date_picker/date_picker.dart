import 'package:flutter/material.dart';

// site : flutter Gems

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({Key? key}) : super(key: key);

  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  // create date time variable
  DateTime selectedDate = DateTime.now();

  _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // show date picker method
  // void _showDatePicker() {
  //   showDatePicker(
  //     useRootNavigator: false,
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2025),
  //   ).then((value) => {
  //         setState(() {
  //           _dateTime = value!;
  //         })
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //display chosen date
            Text(
              selectedDate.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),

            Text(
              // _dateTime.toString(),
              "${selectedDate.toLocal()}".split(' ')[0],
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 15),
            Text(
              // _dateTime.toString(),
              "${selectedDate.toLocal()}".split(' ')[1],
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 15),

            // button
            MaterialButton(
              // on pressed execute _showDatePicker() method
              onPressed: () => _selectedDate(context),
              color: Colors.deepPurple[400],
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Choose Date",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
