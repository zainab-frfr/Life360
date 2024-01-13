import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:namaz_counter/myDatabase/runningDatabase.dart';

class RunningTracker extends StatefulWidget {
  const RunningTracker({super.key});

  @override
  State<RunningTracker> createState() => _RunningTrackerState();
}

class _RunningTrackerState extends State<RunningTracker> {
  // reference the box
  final _myBox = Hive.box('MyBox');
  runningDatabase db = runningDatabase();

  @override
  void initState() {
    if (_myBox.get('times') == null) {
      db.createInitialData();
    } else {
      //there already exists data
      db.loadData();
    }
    super.initState();
  }

  bool _isValidInput(String input) {
    final RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  int myIndex = 0;
  TextEditingController _minutesController = TextEditingController();
  String _errorMessage = '';

  List<Widget> buildWidgets() {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Text('How many minutes did you run?',
                style: TextStyle(fontSize: 14)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: TextField(
              controller: _minutesController,
              cursorColor: Color.fromARGB(255, 255, 188, 87),
              decoration: InputDecoration(
                //labelText: 'How many minutes did you run?',
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                contentPadding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
              onSubmitted: (value) => {
                if (_isValidInput(value))
                  {
                    setState(() {
                      _errorMessage = '';
                      db.updateData(int.parse(value));
                    }),
                  }
                else
                  {
                    setState(() {
                      _errorMessage =
                          'Invalid input. Please enter a valid value.';
                    })
                  },
                _minutesController.text = ''
              },
            ),
          ),
          if (_errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Text(
                'Please enter a valid input',
                style: TextStyle(color: Colors.red, fontSize: 10),
              ),
            )
        ],
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 218, 77, 77),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "Top 3 times",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 132, 22, 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 181, 61),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text("${db.first} min"))),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 181, 61),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text("${db.second} min"))),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 181, 61),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text("${db.third} min"))),
                ),
              ],
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = buildWidgets();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 219, 165),
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.orange,
          currentIndex: myIndex,
          onTap: (value) => {
                setState(() {
                  myIndex = value;
                })
              },
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: const Color.fromARGB(255, 165, 31, 21),
          unselectedItemColor: Color.fromARGB(255, 207, 68, 68),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label: "new record",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_line_chart),
              label: "summary",
            )
          ]),
    );
  }
}
