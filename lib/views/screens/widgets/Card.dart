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
  late Course course;
  @override
  Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.only(right:8),
        child: Card(
          color:Colors.transparent,
           shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 00,
            child: SizedBox(
              width: 150,
              height: 200,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                              widget.course.image!,
                          ),
                      ),
                         const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(widget.course.name!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ), //Textstyle
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: widget.course.price==0? const Text("Free") :Text(widget.course.price!.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ), //Textstyle
                        ),
                      ), 
                    ],
                  ),
                ), //Column
              ), //Padding
            ),
      ); //SizedBox
}
}