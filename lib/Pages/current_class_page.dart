// ignore_for_file: prefer_const_constructors

import 'package:course_management_system/Widgets/classes.dart';
import 'package:course_management_system/core.dart/store.dart';
import 'package:course_management_system/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CurrentClassPage extends StatelessWidget {
  const CurrentClassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyClass currentclass = (VxState.store as Mystore).currentclass;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(currentclass.image).wFull(context).h32(context),
          "Assignments :".text.align(TextAlign.start).bold.xl2.make().p12(),
          ListView.builder(
              shrinkWrap: true,
              itemCount: currentclass.Assigned.length,
              itemBuilder: (context, index) {
                return VxBox(
                    child: Row(
                  children: [
                    currentclass.Assigned[index].heading.text.make().p20(),
                    currentclass.Assigned[index].desc.text.make().p20(),
                  ],
                )).color(Colors.green).rounded.make().onTap(() {
                  Navigator.pushNamed(context, MyRoutes.CurrentAssignmentPage);
                }).p20();
              }).expand(),
        ],
      ),
    );
  }
}
