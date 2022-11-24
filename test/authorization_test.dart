import 'package:flutter_test/flutter_test.dart';
import 'package:qa/models/User.dart';

import 'package:qa/services/LoginService.dart';
import 'package:qa/services/SignUpService.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Login', () {
    test('User logged in successfully', () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      User loggedInUser = await Login("petertest@gmail.com", "petertestpass");
      User expectedUser = User(
          email: "petertest@gmail.com",
          name: "petertest",
          phoneNumber: "",
          id: 2);
      expect(loggedInUser, expectedUser);
    });

    test('User logged in unsuccessfully', () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await Login("whatever@whatever.com", "password12whatever");
      bool? loggedInUser = prefs.getBool("isLoggedin");
      expect(loggedInUser, null);
    });
  });

  group('Register', () {
    test('User registered successfully', () async {
      bool isRegistered = await Register(
          "petertest22@gmail.com", "petertest22pass", "petertest22");
      expect(isRegistered, true);
    });

    test('User registered unsuccessfully', () async {
      bool isRegistered = await Register(
          "petertest22@gmail.com", "petertest22pass", "petertest22");
      expect(isRegistered, false);
    });
  });
}
