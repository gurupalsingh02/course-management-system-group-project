// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StudentAccountPage extends StatelessWidget {
  const StudentAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://img.freepik.com/free-photo/happy-young-female-student-holding-notebooks-from-courses-smiling-camera-standing-spring-clothes-against-blue-background_1258-70161.jpg?size=626&ext=jpg";
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: "Student Account Page".text.make()),
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(8),
            height: 60,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {},
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
                        "StudentName".text.xl3.make(),
                        "student123@gmail.com".text.xl2.make(),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 70,
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
