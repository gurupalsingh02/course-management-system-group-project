// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:course_management_system/Widgets/Student.dart';
import 'package:course_management_system/core.dart/store.dart';
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
      body: Column(
        children: [
          StaggeredGridView.countBuilder(
              itemCount: student.myclasses.length,
              crossAxisCount: 5,
              itemBuilder: (context, index) {
                return VxBox(
                    child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Image.network(student.myclasses[index].image),
                    student.myclasses[index].class_name.text.make(),
                    student.myclasses[index].Teacher_name.text.make()
                  ],
                )).color(Colors.amber).make().p20();
              },
              staggeredTileBuilder: (int index) {
                return StaggeredTile.count(1, 0.9);
              }).expand(),
        ],
      ),
    );
  }
}
