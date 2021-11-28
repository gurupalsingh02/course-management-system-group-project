// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:course_management_system/Pages/account_page.dart';
import 'package:course_management_system/Pages/home_page.dart';
import 'package:course_management_system/Pages/login_page.dart';
import 'package:course_management_system/Pages/login_page_student.dart';
import 'package:course_management_system/Pages/student_account_page.dart';
import 'package:course_management_system/Pages/to_do_page.dart';
import 'package:course_management_system/Routes.dart';
import 'package:flutter/material.dart';

import 'Pages/student_account_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyRoutes.StudentAccountPage,
      routes: {
        MyRoutes.HomePage: (context) => HomePage(),
        MyRoutes.AccountPage: (context) => AccountPage(),
        MyRoutes.ToDoPage: (context) => ToDoPage(),
        MyRoutes.LoginPage: (context) => LoginPage(),
        MyRoutes.StudentLoginPage: (context) => StudentLoginPage(),
        MyRoutes.StudentAccountPage: (context) => StudentAccountPage(),
      },
    );
  }
}
