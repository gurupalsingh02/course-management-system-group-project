// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:course_management_system/Widgets/Student.dart';
import 'package:course_management_system/Widgets/classes.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore {
  MyClass currentclass = MyClass(
      class_name: "", image: "", Teacher_name: "", class_id: "", Assigned: []);
  bool Logged_in_student = false;
  Student user =
      Student(name: "", image: "", Student_id: "", Assigned: [], myclasses: []);
  List<Student> students = [];
  Mystore() {
    currentclass = MyClass(
        class_name: "",
        image: "",
        Teacher_name: "",
        class_id: "",
        Assigned: []);
    bool Logged_in_student = false;
    user = Student(
        name: "", image: "", Student_id: "", Assigned: [], myclasses: []);
    students = [];
  }
}
