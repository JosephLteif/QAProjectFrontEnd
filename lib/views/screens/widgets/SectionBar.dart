import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SectionBar extends StatelessWidget {
  String title;
  Widget redirectPage;
  SectionBar({super.key, required this.title, required this.redirectPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(8),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: 'View All',
                    style: TextStyle(color: Colors.deepPurple),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => redirectPage));
                      }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
