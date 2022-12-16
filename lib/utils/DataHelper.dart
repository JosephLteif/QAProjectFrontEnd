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
          "https://s3-alpha-sig.figma.com/img/7ca4/d6bd/0ea0feb7920ebf3df595777f6115d988?Expires=1670198400&Signature=Wwx18-b~2PUUkV0jVOA64IWIPIB8yeTzclH47tQiJ413DHlDIbqXRSn4OJD4MT6fuSULrht0s9muOfxo1fpKR-v1KabOGyaDnQFeY3xM3Mj0dnxor9vEGVxzM3rTfQ4q2kYvEImASDNMUqQEMRrG3q34zybUhtOco0oxNk1V0FMMbo4kNi8R1O8joybzp6ABuqyth0M5QA2k~TMGFyqFZsm8-M91JH5eDLBHh~VeueK7wEa4RfTVd7WbbJZyWDIMdsaHMfKtmjmxt5gEnpbTTXqN5-Csfu48UmG-EOBwbGkFFkTujX~x4t6lqGhuNwjDS6rp2DRAaoPXVZHKrqzLmA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          faker.currency.random.decimal(),
          faker.date.toString(),
          faker.currency.random.integer(100),
          faker.currency.random.integer(60));
      result.add(course);
    }
    return result;
  }

  static generateCourse() {
    return Course(
        3,
        faker.lorem.word(),
        faker.lorem.sentence(),
        "https://s3-alpha-sig.figma.com/img/7ca4/d6bd/0ea0feb7920ebf3df595777f6115d988?Expires=1670198400&Signature=Wwx18-b~2PUUkV0jVOA64IWIPIB8yeTzclH47tQiJ413DHlDIbqXRSn4OJD4MT6fuSULrht0s9muOfxo1fpKR-v1KabOGyaDnQFeY3xM3Mj0dnxor9vEGVxzM3rTfQ4q2kYvEImASDNMUqQEMRrG3q34zybUhtOco0oxNk1V0FMMbo4kNi8R1O8joybzp6ABuqyth0M5QA2k~TMGFyqFZsm8-M91JH5eDLBHh~VeueK7wEa4RfTVd7WbbJZyWDIMdsaHMfKtmjmxt5gEnpbTTXqN5-Csfu48UmG-EOBwbGkFFkTujX~x4t6lqGhuNwjDS6rp2DRAaoPXVZHKrqzLmA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        faker.currency.random.decimal(),
        faker.date.toString(),
        faker.currency.random.integer(100),
        faker.currency.random.integer(60));
  }
}
