import 'package:flutter/material.dart';
import 'package:namaz_counter/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:namaz_counter/namaz_tracker.dart';

void main() async{
  //initialize the hive 
  await Hive.initFlutter();

  //open a box 
  await Hive.openBox('MyBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, 
      ),
      initialRoute: '/', // set the initial route
      routes: {
        '/': (context) => MyHomePage(), // define the home route
        '/namaz_tracker': (context) => NamazTracker(title: 'Namaz Counter'), // define the namaz_tracker route
      },
    );
  }
}

