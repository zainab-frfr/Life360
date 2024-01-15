import 'package:hive_flutter/hive_flutter.dart';

class runningDatabase {
//------------------- variables and methods for running screen-------------------//
  List<int> times = [];
  int first = 0;
  int second = 0;
  int third = 0;

  int streak = 0;

  // reference the box
  final _myBox = Hive.box('MyBox');

  //if first time opening app
  void createInitialData() {
    times = [];
    first = 0;
    second = 0;
    third = 0;
    streak = 0;
  }

  //load data from database
  void loadData() {
    times = _myBox.get('times');
    first = _myBox.get('first');
    second = _myBox.get('second');
    third = _myBox.get('third');
    streak = _myBox.get('streak');
  }

  //update database, add entry
  void updateData(int time) {
    
    times.add(time);
    _myBox.put('times', times);
    
    maxTimes();
    _myBox.put('first', first);
    _myBox.put('second', second);
    _myBox.put('third', third);
    _myBox.put('streak', streak);

    print(times);
    print(first);
    print(second);
    print(third);
    print(streak);

  }

  void maxTimes() {
    // Sorting the list in descending order
    times.sort((a, b) => b.compareTo(a));

    if (times.length >= 3) {
      first = times[0];
      second = times[1];
      third = times[2];
    }
    else if (times.length >= 2) {
      first = times[0];
      second = times[1];
    }
    else if (times.length >= 1) {
      first = times[0];
    }
  }

  void updateStreak(int value){
    if(value==0){
      streak = 0;
    }
    else{
      streak++;
    }
  }
}
