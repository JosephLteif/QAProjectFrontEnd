import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qa/models/course.dart';
import 'package:qa/services/CoursesService.dart';

import '../models/User.dart';

class CourseState extends ChangeNotifier {
  List<Course> Courses = [];

  void clear() {
    Courses.clear();
    notifyListeners();
  }

  Future<void> getCourses() async {
    await CoursesService().Courses("C++");
    notifyListeners();
  }

}
