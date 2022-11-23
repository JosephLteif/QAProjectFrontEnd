import 'package:flutter/material.dart';

import '../../../models/course.dart';

class CardTile extends StatelessWidget {
  Course course;
  CardTile({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Row(
        children: [
          const Icon(
            Icons.arrow_right,
            color: Color(0xFFC0BDBD),
          ),
          Text(
            // widget.course.price!.toString(),
            "${course.length.toString()} sessions - ${course.price == 0 ? "Free" : course.price!.toStringAsFixed(2) + "\$"}",
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
        child: Text(course.name.toString()),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.network(
          height: 55,
          width: 55,
          fit: BoxFit.fill,
          course.image!,
        ),
      ),
    );
  }
}
