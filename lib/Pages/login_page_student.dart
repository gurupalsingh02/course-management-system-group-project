// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:course_management_system/Routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StudentLoginPage extends StatefulWidget {
  @override
  State<StudentLoginPage> createState() => _LoginPageStudentState();
}

final formkey = GlobalKey<FormState>();

class _LoginPageStudentState extends State<StudentLoginPage> {
  bool change = false;
  var hidepassword = true;
  final _formkey = GlobalKey<FormState>();
  GotoHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        change = !change;
      });
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushNamed(context, MyRoutes.HomePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            VxBox().make().h20(context),
            Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username Can't be Empty";
                          }
                          return null;
                        },
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: "enter your Username",
                          labelText: "Username",
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Can't be Empty";
                          } else if (value.length < 8) {
                            return "Password's length should be at least 8";
                          } else {
                            String a = value.toLowerCase();
                            if (value.compareTo(a) == 0) {
                              return "password must contain at least 1 Upper case character";
                            }
                          }
                          return null;
                        },
                        obscureText: hidepassword,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  hidepassword = !hidepassword;
                                });
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                color:
                                    hidepassword ? Colors.black : Colors.blue,
                              )),
                          hintText: "enter your Password",
                          labelText: "Password",
                        ),
                      )
                    ],
                  ),
                )),
            InkWell(
              onTap: () => GotoHome(context),
              child: AnimatedContainer(
                height: 40,
                width: change ? 40 : 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: change ? Colors.red : Colors.lightBlue,
                ),
                duration: Duration(seconds: 2),
                child:
                    Center(child: change ? Icon(Icons.login) : Text("Login")),
              ),
            ),
            "skip for now".text.color(Colors.red).bold.make().p12().onTap(() {
              Navigator.pushNamed(context, MyRoutes.HomePage);
            }),
          ],
        ),
      ),
    );
  }
}
