// ignore_for_file: file_names, non_constant_identifier_names

import 'package:course_management_system/Widgets/asssignments.dart';
import 'package:course_management_system/Widgets/classes.dart';

class Student {
  String name;
  String image;
  String Student_id;
  List<Assignment> MyAssignments = [];
  List<MyClass> myclasses = [];
  Student({
    required this.name,
    required this.image,
    required this.Student_id,
    required this.MyAssignments,
    required this.myclasses,
    //required List Assigned,
  });
}
