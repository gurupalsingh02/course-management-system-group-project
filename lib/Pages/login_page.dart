// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:course_management_system/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBox(
            child: Center(child: "Login As Teacher".text.size(30).bold.make()),
          )
              .color(Colors.blue)
              .rounded
              .make()
              .w20(context)
              .h10(context)
              .onTap(() {}),
          VxBox(
            child: Center(child: "Login As Student".text.bold.size(30).make()),
          )
              .color(Colors.blue)
              .rounded
              .make()
              .w20(context)
              .h10(context)
              .onTap(() {
            Navigator.pushNamed(context, MyRoutes.StudentLoginPage);
          })
        ],
      ),
    );
  }
}
