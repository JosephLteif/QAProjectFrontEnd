import 'package:faker/faker.dart';

import '../models/course.dart';

class DataHelper {
  static List<Course> generateClasses(int count) {
    List<Course> result = [];
    for (int i = 0; i < count; i++) {
      Course course = Course(
          3,
          faker.lorem.word(),
          faker.lorem.sentence(),
          "https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI",
          faker.currency.random.decimal(),
          faker.date.toString(),
          faker.currency.random.integer(100),
          faker.currency.random.integer(60));
      result.add(course);
    }
    return result;
  }
}
