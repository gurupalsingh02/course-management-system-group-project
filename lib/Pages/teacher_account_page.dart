// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:course_management_system/Pages/login_page_teacher.dart';
import 'package:course_management_system/Pages/student_account_page.dart';
import 'package:course_management_system/Widgets/asssignments.dart';
import 'package:course_management_system/Widgets/classes.dart';
import 'package:course_management_system/core.dart/store.dart';
import 'package:course_management_system/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_management_system/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TeacherAccountPage extends StatefulWidget {
  const TeacherAccountPage({Key? key}) : super(key: key);

  @override
  TeacherHomeScreen createState() => TeacherHomeScreen();
}


class TeacherHomeScreen extends State<TeacherAccountPage> {
  // const TeacherAccountPage({Key? key}) : super(key: key);

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
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
          body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset("assets/logo.png", fit: BoxFit.contain),
              ),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),
      ),
        ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TeacherLoginScreen()));
  }
}
