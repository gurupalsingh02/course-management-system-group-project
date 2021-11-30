// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:course_management_system/Widgets/asssignments.dart';
import 'package:course_management_system/Widgets/classes.dart';
import 'package:course_management_system/core.dart/store.dart';
import 'package:course_management_system/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TeacherAccountPage extends StatelessWidget {
  const TeacherAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Assignment a1 = Assignment(heading: "a1", desc: "this is assignment a1");
    Assignment a2 = Assignment(heading: "a2", desc: "This is assignment a2");
    Assignment a3 = Assignment(heading: "a3", desc: "this is assignment a3");
    Assignment a4 = Assignment(heading: "a4", desc: "this is assignment a4");
    MyClass myClass = MyClass(
        class_name: "myclass",
        image:
            "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
        Teacher_name: "guru",
        class_id: "",
        Assigned: [a1, a2, a3, a4]);
    (VxState.store as Mystore).teacher.myclasses.add(myClass);

    const imageUrl =
        "https://img.freepik.com/free-photo/happy-young-female-student-holding-notebooks-from-courses-smiling-camera-standing-spring-clothes-against-blue-background_1258-70161.jpg?size=626&ext=jpg";
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: "Teacher Account Page".text.make()),
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(8),
            height: 60,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.HomePage);
                    },
                    icon: Icon(
                      Icons.person,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.HomePage);
                    },
                    icon: Icon(
                      Icons.person,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.HomePage);
                    },
                    icon: Icon(
                      Icons.person,
                      size: 45,
                    )),
              ],
            ),
          ),
          body: Column(
            children: [
              VxBox(
                      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 70),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        (VxState.store as Mystore).teacher.name.text.xl3.make(),
                        ((VxState.store as Mystore).teacher.name +
                                "123@gmail.com")
                            .text
                            .xl2
                            .make(),
                      ],
                    ),
                  ).w60(context),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ],
              ))
                  .green100
                  .py16
                  .px16
                  .make()
                  .wFull(context)
                  .py8()
                  .hOneForth(context),
            ],
          )),
    );
  }
}
