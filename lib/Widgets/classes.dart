// ignore_for_file: non_constant_identifier_names

import 'package:course_management_system/Widgets/asssignments.dart';

class MyClass {
  final String class_name;
  final String image;
  final String Teacher_name;
  final String class_id;
  List<Assignment> Assigned = [];
  MyClass({
    required this.class_name,
    required this.image,
    required this.Teacher_name,
    required this.class_id,
    required this.Assigned,
  });
}
