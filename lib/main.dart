<<<<<<< HEAD
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
=======
// ignore_for_file: prefer_const_constructors
>>>>>>> c74088acf36b8c075cef8dc3878be676b6dbb833

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
<<<<<<< HEAD
            child: Column(
          children: [
            Text("CS261 Group Project"),
            Text("Akash has accepted and Initalized the project.")
          ],
        )),
=======
          child: Text("This is the dev branch"),
        ),
>>>>>>> c74088acf36b8c075cef8dc3878be676b6dbb833
      ),
    );
  }
}
