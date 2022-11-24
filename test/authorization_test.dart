import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qa/models/User.dart';

import 'package:qa/services/LoginService.dart';
import 'package:qa/services/SignUpService.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Login', () {
    test('User logged in successfully', () async {
      User loggedInUser = await Login("petertest@gmail.com", "petertestpass");
      expect(loggedInUser, isInstanceOf<User>());
    });

    test('User logged in unsuccessfully', () async {
      User loggedInUser =
          await Login("whatever@whatever.com", "password12whatever");

      expect(loggedInUser, isInstanceOf<User>());
    });
  });

  group('Register', () {
    test('User registered successfully', () async {
      bool isRegistered = await Register(
          "petertest44@gmail.com", "petertest44pass", "petertest44");
      expect(isRegistered, true);
    });

    test('User registered unsuccessfully', () async {
      bool isRegistered = await Register(
          "petertest44@gmail.com", "petertest44pass", "petertest44");
      expect(isRegistered, false);
    });
  });
}
