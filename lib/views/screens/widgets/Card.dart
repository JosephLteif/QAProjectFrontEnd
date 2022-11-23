import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qa/models/course.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatefulWidget {
  Course course;
  CardWidget({Key? key, required this.course}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 160,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        color: const Color(0xFF343434),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              child: Image.network(
                height: 108,
                width: 180,
                fit: BoxFit.fill,
                widget.course.image!,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.course.name!,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ), //Textstyle
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Color(0xFFC0BDBD),
                    ),
                    Text(
                      // widget.course.price!.toString(),
                      "${widget.course.length.toString()} sessions - ${widget.course.price == 0 ? "Free" : widget.course.price!.toStringAsFixed(2) + "\$"}",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFC0BDBD)), //Textstyle
                    ),
                  ],
                )),
          ],
        ), //Column
      ),
    ); //SizedBox
  }
}
