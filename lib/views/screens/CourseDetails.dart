import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qa/models/course.dart';
import 'package:qa/models/sessions.dart';
import 'package:qa/utils/DataHelper.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:provider/provider.dart';
import 'package:qa/views/screens/Profile.dart';
import 'package:qa/views/screens/widgets/Session.dart';

class CourseDetails extends StatefulWidget {
  Course course;
  CourseDetails({super.key, required this.course});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  List<Session> sessions = DataHelper.generateSession(10);
  SettingsNotifier settingsNotifier = SettingsNotifier();
  @override
  Widget build(BuildContext context) {
  return Consumer<SettingsNotifier>(
    builder: (context, theme, _) => Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios
              // color: Colors.black54,
              ),
        ),
        title: const Text("My Courses"),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: 
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  fit: BoxFit.fill,
                  widget.course.image!,
                ),
              ),
              const SizedBox(height: 10),

              Container(
                alignment: Alignment.topLeft,
                child: Text(widget.course.name!.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
              ),
              const SizedBox(height: 10),
              Text(widget.course.description!.toString()),
              const SizedBox(height: 10),

              ElevatedButton (
                onPressed: () {
                },
                style:  TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    fixedSize: const Size.fromWidth(500)
                  ),
                child: const Text('Enroll'),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.purple),
              const SizedBox(height: 10),

              Container(
                width: 500,
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                      children: [
                        const Icon(
                          Icons.arrow_right,
                          color: Color(0xFFC0BDBD),
                        ),
                        Text(
                          // widget.widget.course.price!.toString(),
                          "${widget.course.length.toString()} sessions",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFFC0BDBD)), //Textstyle
                        ),
                      ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                      children: [
                        const Text("  "),
                        const Icon(
                          Icons.people_rounded,
                          size: 14,
                          color: Color(0xFFC0BDBD),
                        ),
                        Text(
                          // widget.widget.course.price!.toString(),
                          "  ${widget.course.students.toString()} users enrolled",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFFC0BDBD)), //Textstyle
                        ),
                      ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                      children: [
                        Text(
                          // widget.widget.course.price!.toString(),
                          widget.course.price == 0 ? "   Free" :"   \$    ${widget.course.price!.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFFC0BDBD)), //Textstyle
                        ),
                      ],
                      ),
                    ],
                  )
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.topLeft,
                child: const Text("Curriculum",
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
              ),
                        Expanded(
            child: ListView.builder(
                itemCount: sessions.length,
                itemBuilder: (context, index) =>
                  SessionTile(session: sessions[index], num: index+1)
                ),
              )
            ],
        ),
        ),
      ),
    ),
  );
  }
}
