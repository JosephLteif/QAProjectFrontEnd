import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:provider/provider.dart';
import 'package:qa/models/course.dart';
import 'package:qa/utils/DataHelper.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:qa/views/screens/widgets/Card.dart';
import 'package:qa/views/screens/widgets/CardTile.dart';
import 'package:qa/views/screens/widgets/SectionBar.dart';

import 'ViewAllPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<Course> courses = DataHelper.generateClasses(10);
    List<Course> freeCourses = DataHelper.generateClasses(10);

    return Consumer<SettingsNotifier>(
        builder: (context, theme, _) => Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discover",
                          style: TextStyle(fontSize: 32),
                        ),
                        IconButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: ((context) => Notifications())));
                            },
                            icon: const Icon(Icons.notifications))
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width - 38,
                      height: MediaQuery.of(context).size.height / 20,
                      child: const TextField(
                        cursorHeight: 20,
                        autofocus: false,
                        decoration: InputDecoration(
                          suffix: Icon(Icons.search, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'Search',
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ViewAllPage(courses: courses,title: "Java")))
                            .then((value) => setState(() {}));
                          },
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.deepPurple,
                            ),
                            child: Center(child: Text("Java")),
                            
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.deepPurple,
                    ),
                    Column(
                      children: [
                        SectionBar(
                          title: "Top Picks For You",
                          redirectPage: ViewAllPage(
                            courses: courses,
                            title: "Top Picks For You",
                          ),
                        ),
                        Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(8),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(8),
                              itemCount: courses.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CardWidget(
                                  course: courses[index],
                                );
                              }),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.deepPurple,
                        ),
                        SectionBar(
                          title: "Popular Courses",
                          redirectPage: ViewAllPage(
                            courses: courses,
                            title: "Popular Courses",
                          ),
                        ),
                        SizedBox(
                          height: 75 * 5,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(8),
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return CardTile(
                                  course: freeCourses[index],
                                );
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ));
  }
}
