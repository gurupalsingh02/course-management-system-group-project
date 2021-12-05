// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:course_management_system/Widgets/Student.dart';
import 'package:course_management_system/Widgets/asssignments.dart';
import 'package:course_management_system/Widgets/classes.dart';
import 'package:course_management_system/Widgets/teacher.dart';
import 'package:course_management_system/core.dart/store.dart';
import 'package:course_management_system/routes.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({Key? key}) : super(key: key);

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    Teacher teacher = (VxState.store as Mystore).teacher;
    create_class() {
      int length = (VxState.store as Mystore).allclasses.length;
      String temp_class_code = "myclass/${teacher.name}/${length}}";
      (VxState.store as Mystore).allclasses.add(MyClass(
          class_name: "myclass",
          image:
              "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
          Teacher_name: "guru",
          class_code: "myclass/${teacher.name}/${length}}",
          Assigned: []));
      (VxState.store as Mystore)
          .teacher
          .myclasses
          .add(MyClass.getbyid(temp_class_code));
    }

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              create_class();
              setState(() {
                teacher = (VxState.store as Mystore).teacher;
              });
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ).px64(),
        ],
      ),
      body: StaggeredGridView.countBuilder(
          itemCount: teacher.myclasses.length,
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            return VxBox(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Image.network(teacher.myclasses[index].image)
                    .box
                    .rounded
                    .p8
                    .color(Colors.black)
                    .make(),
                teacher.myclasses[index].class_name.text.underline.bold
                    .make()
                    .p8(),
                ("Teacher - " + teacher.myclasses[index].Teacher_name)
                    .text
                    .underline
                    .capitalize
                    .bold
                    .color(Colors.red)
                    .make()
                    .p8(),
              ],
            ))
                .color(Colors.green)
                .rounded
                .border(color: Colors.lightBlue, width: 5)
                .make()
                .onTap(() {
                  (VxState.store as Mystore).currentclass =
                      teacher.myclasses[index];
                  Navigator.pushNamed(context, MyRoutes.CurrentClassPage);
                })
                .p20()
                .expand();
          },
          staggeredTileBuilder: (int index) {
            return StaggeredTile.count(1, 1.2);
          }),
    );
  }
}
