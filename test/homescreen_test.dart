import 'package:flutter_test/flutter_test.dart';
import 'package:qa/models/course.dart';
import 'package:qa/services/LoginService.dart';

import 'package:qa/utils/DataHelper.dart';

void main() {
  group('Courses', () {
    test('Fetch a list of courses successfully', () async {
      var coursesList = await DataHelper.generateClasses(40);
      expectLater(coursesList, isInstanceOf<List<Course>>());
    });

    test('Fetch a list of 40 courses', () async {
      var coursesList = await DataHelper.generateClasses(40);
      expectLater(40, coursesList.length);
    });

    test('Fetch a list of courses unsuccessfully', () async {
      expectLater(Login("whatever@whatever.com", "password12whatever"),
          throwsException);
    });

    test('Fetch a course with a specific course ID successfully', () async {
      var course = await DataHelper.generateCourse();
      expectLater(course, isInstanceOf<Course>());
    });

    test('Fetch a course with a specific course ID unsuccessfully', () async {
      expectLater(Login("whatever@whatever.com", "password12whatever"),
          throwsException);
    });
  });
}
