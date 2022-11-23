import 'package:flutter/material.dart';
import 'package:qa/views/screens/widgets/Card.dart';
import '../../models/course.dart';

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
                itemBuilder: (context, index) => ListTile(
                      subtitle: Row(
                        children: [
                          const Icon(
                            Icons.arrow_right,
                            color: Color(0xFFC0BDBD),
                          ),
                          Text(
                            // widget.course.price!.toString(),
                            "${courses[index].length.toString()} sessions - ${courses[index].price == 0 ? "Free" : courses[index].price!.toStringAsFixed(2) + "\$"}",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFC0BDBD)), //Textstyle
                          ),
                        ],
                      ),
                      onTap: () {},
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(courses[index].name.toString()),
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          height: 55,
                          width: 55,
                          fit: BoxFit.fill,
                          courses[index].image!,
                        ),
                      ),
                    )),
          )
        ],
      )),
    );
  }
}
