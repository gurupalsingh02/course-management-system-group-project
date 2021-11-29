// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
        Text("Assigned task will appear here."),
        Text("Missing task will appear here."),
        Text("Done task will appear here."),
      ]),
      drawer: Drawer(),
    );
  }
}
