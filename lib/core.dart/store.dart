import 'package:course_management_system/Widgets/Student.dart';
import 'package:course_management_system/Widgets/asssignments.dart';
import 'package:course_management_system/Widgets/classes.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore {
  Student student = Student(
      name: "Guru",
      image: "image",
      Student_id: "202011022",
      Assigned: [],
      myclasses: [
        MyClass(
            class_name: "Computer",
            image: "",
            Teacher_name: "iyyer",
            class_id: "1",
            Assigned: [
              Assignment(heading: "a1 assignment"),
              Assignment(heading: "a2 assignment"),
              Assignment(heading: "a3 assignment"),
              Assignment(heading: "a4 assignment"),
              Assignment(heading: "a5 assignment"),
            ])
      ]);
  Mystore() {
    student = Student(
        name: "Guru",
        image: "image",
        Student_id: "202011022",
        Assigned: [],
        myclasses: [
          MyClass(
              class_name: "Computer",
              image:
                  "https://smarts-ef.org/wp-content/uploads/2018/11/Computer-Monitor-computer-parts.jpg",
              Teacher_name: "iyyer",
              class_id: "1",
              Assigned: [
                Assignment(heading: "a1 assignment"),
                Assignment(heading: "a2 assignment"),
                Assignment(heading: "a3 assignment"),
                Assignment(heading: "a4 assignment"),
                Assignment(heading: "a5 assignment"),
              ]),
          MyClass(
              class_name: "science",
              image:
                  "https://content.twinkl.co.uk/website/uploaded/easyscience-1489076440.jpg",
              Teacher_name: "teacher",
              class_id: "2",
              Assigned: [
                Assignment(heading: "a1 assignment"),
                Assignment(heading: "a2 assignment"),
                Assignment(heading: "a3 assignment"),
                Assignment(heading: "a4 assignment"),
                Assignment(heading: "a5 assignment"),
              ])
        ]);
  }
}
