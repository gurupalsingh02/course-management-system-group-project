// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:course_management_system/Pages/login_page_student.dart';
import 'package:course_management_system/core.dart/store.dart';
import 'package:course_management_system/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_management_system/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentAccountPage extends StatefulWidget {
  const StudentAccountPage({Key? key}) : super(key: key);

  @override
  StudentHomeScreen createState() => StudentHomeScreen();
}

class  StudentHomeScreen extends State<StudentAccountPage> {
  // const StudentAccountPage({Key? key}) : super(key: key);
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
    final _student = (VxState.store as Mystore).student;
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
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.HomePage);
                    },
                    icon: Icon(
                      Icons.person,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.ToDoPage);
                    },
                    icon: Icon(
                      Icons.person,
                      size: 45,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.CurrentClassPage);
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
        MaterialPageRoute(builder: (context) => StudentLoginScreen()));
  }

}
