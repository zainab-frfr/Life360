import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 234, 234),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Ink(
              width: 60,
              height: 60,
              decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 185, 159, 255),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: ImageIcon(AssetImage("images/prayIcon.png"), size: 100,),
                color: Colors.black,
                tooltip: "Namaz Tracker",
                onPressed: () {
                  Navigator.pushNamed(context,'/namaz_tracker'); // navigate to the namaz_tracker route
                },
              ),
            ),
            SizedBox(height: 20,),
            Ink(
              width: 60,
              height: 60,
              decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 231, 160, 84),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: ImageIcon(AssetImage("images/runningIcon.png"), size: 100,),
                color: Colors.black,
                tooltip: "Running Tracker",
                onPressed: () {

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
