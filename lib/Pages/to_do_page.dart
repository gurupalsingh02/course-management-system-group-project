// ignore_for_file: prefer_const_constructors,, avoid_unnecessary_containers

import 'package:course_management_system/Widgets/Student.dart';
import 'package:course_management_system/Widgets/asssignments.dart';
import 'package:course_management_system/Widgets/classes.dart';
import 'package:course_management_system/Widgets/student.dart';
import 'package:course_management_system/core.dart/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../routes.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "To-do".text.make(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            //Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: ("Assigned")),
            Tab(text: ("Missing")),
            Tab(text: ("Done")),
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: const [
        AssignedTODo(),
        MissingToDo(),
        DoneToDo(),
      ]),
      drawer: Drawer(),
    );
  }
}

class AssignedTODo extends StatelessWidget {
  const AssignedTODo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyClass currentclass = (VxState.store as Mystore).currentclass;
    var _student = (VxState.store as Mystore).student;
    return Container(
      child: Column(
        children: [
          "Assigned task will appear here.".text.bold.make(),
          //currentclass.Assigned[].done?
          ListView.builder(
              shrinkWrap: true,
              itemCount: currentclass.Assigned.length,
              itemBuilder: (context, index) {
                return VxBox(
                    child: Row(
                  children: [
                    currentclass.Assigned[index].heading.text.make().p20(),
                    currentclass.Assigned[index].desc.text.make().p20(),
                  ],
                )).color(Colors.green).rounded.make().onTap(() {
                  Navigator.pushNamed(context, MyRoutes.CurrentAssignmentPage);
                }).p20();
              }).expand(),
        ],
      ),
    );
  }
}

class MissingToDo extends StatelessWidget {
  const MissingToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MyClass currentclass = (VxState.store as Mystore).currentclass;
    return Container(
      child: Column(
        children: [
          "Missing task will appear here.".text.bold.make(),
        ],
      ),
    );
  }
}

class DoneToDo extends StatelessWidget {
  const DoneToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyClass currentclass = (VxState.store as Mystore).currentclass;
    return Container(
      child: Column(
        children: [
          "Done task will appear here.".text.bold.make(),
          ListView.builder(
              shrinkWrap: true,
              itemCount: currentclass.Assigned.length,
              itemBuilder: (context, index) {
                return VxBox(
                    child: Row(
                  children: [
                    currentclass.Assigned[index].heading.text.make().p20(),
                    currentclass.Assigned[index].desc.text.make().p20(),
                  ],
                )).color(Colors.green).rounded.make().onTap(() {
                  Navigator.pushNamed(context, MyRoutes.CurrentAssignmentPage);
                }).p20();
              }).expand(),
        ],
      ),
    );
  }
}
