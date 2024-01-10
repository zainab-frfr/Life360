import 'package:flutter/material.dart';

class RunningTracker extends StatefulWidget {
  const RunningTracker({super.key});

  @override
  State<RunningTracker> createState() => _RunningTrackerState();
}

class _RunningTrackerState extends State<RunningTracker> {
  TextEditingController _minutesController = TextEditingController();

void _pickMinutes(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 255, 255, 117),
        title: Text('How long did you run? '),
        content: TextField(
          controller: _minutesController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter Minutes',
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'OK',
              style:  TextStyle(
                color: Color.fromARGB(255, 212, 59, 12)
              ),
            ),
            onPressed: () {
              if (_isValidInput(_minutesController.text)) {
                int minutes = int.parse(_minutesController.text);
                print('Selected Minutes: $minutes');
                Navigator.of(context).pop(); // Close the dialog
              } else {
                print('Invalid input');
              }
            },
          ),
        ],
      );
    },
  );
}

bool _isValidInput(String input) {
  final RegExp regex = RegExp(r'^[0-9]+$');
  return regex.hasMatch(input);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 219, 165),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Color.fromARGB(255, 212, 59, 12),
            onPressed: ()=>_pickMinutes( context),child: Icon(Icons.add_chart,size: 35), 
            tooltip: "Create New Record",
          ),
        ],
      )),
    );
  }
}


