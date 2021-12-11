import 'package:course_management_system/Widgets/classes.dart';
import 'package:course_management_system/core.dart/store.dart';
import 'package:course_management_system/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ClassCreatePage extends StatelessWidget {
  const ClassCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    String classname = "";
    String classimage = "";
    String teachername = "";
    create_class({
      required String classname,
      required String classimage,
      required String teachername,
    }) {
      if (formkey.currentState!.validate()) {
        int length = (VxState.store as Mystore).allclasses.length;
        String temp_class_code = "allclass/${length}";
        (VxState.store as Mystore).allclasses.add(MyClass(
            class_name: classname,
            image: classimage,
            Teacher_name: teachername,
            class_code: temp_class_code,
            Assigned: []));
        (VxState.store as Mystore).teacher.class_ids.add(temp_class_code);
        Navigator.pushNamed(context, MyRoutes.TeacherHomePage);
      }
    }

    return Material(
      child: Column(
        children: [
          Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Class Name Can't be Empty";
                        }
                        classname = value;
                        return null;
                      },
                      decoration: InputDecoration(
                          label: "Class Name".text.make(),
                          hintText: "Enter The Class Name")),
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Class Image Url Can't be Empty";
                        }
                        classimage = value;
                        return null;
                      },
                      decoration: InputDecoration(
                          label: "Class Image".text.make(),
                          hintText: "Enter The Class Image Url")),
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Class Teacher Name Can't be Empty";
                        }
                        teachername = value;
                        return null;
                      },
                      decoration: InputDecoration(
                          label: "Class Teacher".text.make(),
                          hintText: "Enter The Class Teacher Name")),
                ],
              ).p12()),
          "Create Class"
              .text
              .make()
              .p12()
              .box
              .roundedLg
              .color(Colors.lightBlue)
              .make()
              .onTap(() {
            create_class(
                classname: classname,
                classimage: classimage,
                teachername: teachername);
          }),
        ],
      ),
    );
  }
}
