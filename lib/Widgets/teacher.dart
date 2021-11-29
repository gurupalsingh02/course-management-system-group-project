// ignore_for_file: file_names, non_constant_identifier_names

import 'package:course_management_system/Widgets/classes.dart';

class Teacher {
  String name;
  String image;
  String Teacher_id;
  List<MyClass> myclasses = [];
  Teacher({
    required this.name,
    required this.image,
    required this.Teacher_id,
    required this.myclasses,
  });
}
