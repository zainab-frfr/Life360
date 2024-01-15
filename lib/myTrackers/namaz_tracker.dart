import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:namaz_counter/myDatabase/counterDatabase.dart';

class NamazTracker extends StatefulWidget {
  const NamazTracker({super.key, required this.title});

  final String title;

  @override
  State<NamazTracker> createState() => _NamazTrackerState();
}

class _NamazTrackerState extends State<NamazTracker> {

  // reference the box
  final _myBox = Hive.box('MyBox');
  counterDatabase db = counterDatabase();

   @override
  void initState() {
    // if first time ever opening app then create default data
    if(_myBox.get('counters')==null){
      db.createInitialData();
    }
    else{
      //there already exists data
      db.loadData();
    }
    super.initState();
  }

  void _inc(int i) {
    setState(() {
      db.counters[i]++;
      db.counters[5]++;
    });
    db.updateData();
  }

  void _dec(int i) {
    setState(() {
      db.counters[i]--;
      db.counters[5]--;
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              const SizedBox(width: 40),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(239, 207, 158, 214),//Color.fromARGB(240, 202, 152, 210),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Total Namaz Left',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${db.counters[5]}',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 40),
            ]),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Fajr',
                    ),
                    Text(
                      '${db.counters[0]}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () => _inc(0),
                          tooltip: 'Increment',
                          child: const Icon(Icons.add),
                        ),
                        const SizedBox(width: 20),
                        FloatingActionButton(
                          onPressed: () => _dec(0),
                          tooltip: 'Decrement',
                          child: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Zuhr',
                    ),
                    Text(
                      '${db.counters[1]}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () => _inc(1),
                          tooltip: 'Increment',
                          child: const Icon(Icons.add),
                        ),
                        const SizedBox(width: 20),
                        FloatingActionButton(
                          onPressed: () => _dec(1),
                          tooltip: 'Decrement',
                          child: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Asr',
                    ),
                    Text(
                      '${db.counters[2]}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () => _inc(2),
                          tooltip: 'Increment',
                          child: const Icon(Icons.add),
                        ),
                        const SizedBox(width: 20),
                        FloatingActionButton(
                          onPressed: () => _dec(2),
                          tooltip: 'Decrement',
                          child: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Maghrib',
                    ),
                    Text(
                      '${db.counters[3]}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () => _inc(3),
                          tooltip: 'Increment',
                          child: const Icon(Icons.add),
                        ),
                        const SizedBox(width: 20),
                        FloatingActionButton(
                          onPressed: () => _dec(3),
                          tooltip: 'Decrement',
                          child: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Isha',
                ),
                Text(
                  '${db.counters[4]}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () => _inc(4),
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(width: 20),
                    FloatingActionButton(
                      onPressed:() => _dec(4),
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
