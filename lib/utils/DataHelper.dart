import 'package:faker/faker.dart';
import 'package:qa/models/sessions.dart';

import '../models/course.dart';

class DataHelper {
  static List<Course> generateClasses(int count) {
    List<Course> result = [];
    for (int i = 0; i < count; i++) {
      Course course = Course(
          3,
          faker.lorem.word(),
          faker.lorem.sentence(),
          "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjYdlNQTXP5pTpqN3fQwfF__WHtEmflMVuLS6ErWorUPYM9MwThUmwuBfFhDMVtw5X1jVmchC9z20Bl_yD7M_thVbCmhRJLyZqh3sHZBm6Sryz_xyu4cvusk_xx1kJCh5ANM-TtsvG1WwqMUPllTZegJlstUj3KDesGJ2Xrh6AsLU9HvaFCLT4RLZd7/s1600/resize%20play_10-android_dev.png",
          faker.currency.random.decimal(),
          faker.date.toString(),
          faker.currency.random.integer(100),
          faker.currency.random.integer(60),
          faker.currency.random.integer(60));
      result.add(course);
    }
    return result;
  }
    static Course generateClasse() {
      Course course = Course(
          3,
          faker.lorem.word(),
          faker.lorem.sentence(),
          "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjYdlNQTXP5pTpqN3fQwfF__WHtEmflMVuLS6ErWorUPYM9MwThUmwuBfFhDMVtw5X1jVmchC9z20Bl_yD7M_thVbCmhRJLyZqh3sHZBm6Sryz_xyu4cvusk_xx1kJCh5ANM-TtsvG1WwqMUPllTZegJlstUj3KDesGJ2Xrh6AsLU9HvaFCLT4RLZd7/s1600/resize%20play_10-android_dev.png",
          faker.currency.random.decimal(),
          faker.date.toString(),
          faker.currency.random.integer(100),
          faker.currency.random.integer(60),
          faker.currency.random.integer(60));    
    return course;
  }
  static List<Session> generateSession(int count){
    List<Session> result = [];
    for (int i = 0; i < count; i++) {
      Session session = Session(
        1,
        faker.lorem.word(),
        faker.currency.random.integer(60),
        "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
      );
      result.add(session);
    }
   
      return result;
  }
}
