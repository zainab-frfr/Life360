import 'package:hive_flutter/hive_flutter.dart';

class counterDatabase{

  List counters = [];

  
  // reference the box
  final _myBox = Hive.box('MyBox');

  //if first time opening app
  void createInitialData(){
    counters = [
      3650,
      3650,
      3650,
      3650,
      3650,
      18250,
    ];
  }

  //load data from database
  void loadData(){
    counters = _myBox.get('counters');
  }

  //update database
  void updateData(){
    _myBox.put('counters', counters);
  }
}