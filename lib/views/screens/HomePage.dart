import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:provider/provider.dart';
import 'package:qa/models/course.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:qa/views/screens/widgets/Card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    Course course  = Course(1,"TeachMe","'test'","https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI",9.99,"1-1-2001",20,60);
    Course freecourse  = Course(1,"TeachMe","'test'","https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI",0,"1-1-2001",20,60);

    List<Course> courses=[];
    List<Course> freeCourses=[];
    for(int i=0;i<10;i++){
      courses.add(course);
      freeCourses.add(freecourse);
    }

  return Consumer<SettingsNotifier>(
        builder: (context, theme, _) => MaterialApp(
          theme: theme.getTheme(),
          home: Scaffold(
            appBar: AppBar(
              title: const Text("Discover"),
               actions: [
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
          body: Scaffold(
              body: SafeArea(
            //by default scroll directioin is vertical
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(top:18,left:18,right: 18),     
                            width: MediaQuery.of(context).size.width - 38,
                            height: MediaQuery.of(context).size.height /20, 
                          child: const TextField(
                            cursorHeight: 20,
                            autofocus: false,
                            decoration:   InputDecoration(
                              suffix: Icon(Icons.search, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                
                              labelText: 'Search',
                              labelStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: Colors.grey),
                              ),
                              
                            ),
                           ),
                        ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   const Text("Top Picks For You",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                                  RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.blue, fontSize: 14.0,fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'View All',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print('Terms of Service"');
                                        }),
                                ],
                              ),
                            ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height/ 3,
                              width: MediaQuery.of(context).size.width ,
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(8),
                              child:ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(8),
                                itemCount: courses.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CardWidget(course: courses[index],);
                                }
                              ), 
                              ),
                
                            //Free courses
                             Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   const Text("Free Courses",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                                  RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.blue, fontSize: 14.0,fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'View All',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print('Terms of Service"');
                                        }),
                                ],
                              ),
                            ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height/ 3,
                              width: MediaQuery.of(context).size.width ,
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(8),
                              child:ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(8),
                                itemCount: freeCourses.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CardWidget(course: freeCourses[index],);
                                }
                              ), 
                              ),
                
                            //GetCertified
                             Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   const Text("Get Certified",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                                  RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.blue, fontSize: 14.0,fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'View All',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print('Terms of Service"');
                                        }),
                                ],
                              ),
                            ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height/ 3,
                              width: MediaQuery.of(context).size.width ,
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(8),
                              child:ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(8),
                                itemCount: courses.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CardWidget(course: courses[index],);
                                }
                              ), 
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                
               ),
              )),
    ));
  }
}