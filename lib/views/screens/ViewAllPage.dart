import 'package:flutter/material.dart';
import 'package:qa/views/screens/widgets/Card.dart';
import '../../models/course.dart';
import 'widgets/CardTile.dart';

class ViewAllPage extends StatelessWidget {
  List<Course> courses;
  String title;
  ViewAllPage({Key? key, required this.courses, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Text(
                title,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) =>
                    CardTile(course: courses[index])),
          )
        ],
      )),
    );
  }
}
