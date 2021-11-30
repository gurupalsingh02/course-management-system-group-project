// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:course_management_system/Widgets/Student.dart';
import 'package:course_management_system/Widgets/asssignments.dart';
import 'package:course_management_system/Widgets/classes.dart';
import 'package:course_management_system/core.dart/store.dart';
import 'package:course_management_system/routes.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Student student = (VxState.store as Mystore).student;
    
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: StaggeredGridView.countBuilder(
          itemCount: student.myclasses.length,
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            return VxBox(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Image.network(student.myclasses[index].image)
                    .box
                    .rounded
                    .p8
                    .color(Colors.black)
                    .make(),
                student.myclasses[index].class_name.text.underline.bold
                    .make()
                    .p8(),
                ("Teacher - " + student.myclasses[index].Teacher_name)
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
                      student.myclasses[index];
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
