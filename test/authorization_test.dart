import 'package:flutter_test/flutter_test.dart';
import 'package:qa/models/User.dart';

import 'package:qa/services/LoginService.dart';
import 'package:qa/services/SignUpService.dart';

void main() {
  group('Login', () {
    test('User logged in successfully', () async {
      User loggedInUser = await Login("petertest@gmail.com", "petertestpass");
      expectLater(loggedInUser, isInstanceOf<User>());
    });

    test('User logged in unsuccessfully', () async {
      expectLater(Login("whatever@whatever.com", "password12whatever"),
          throwsException);
    });
  });

  group('Register', () {
    test('User registered successfully', () async {
      bool isRegistered =
          await Register("joseph11@gmail.com", "joseph11pass", "joseph11");
      expect(isRegistered, true);
    });

    test('User registered unsuccessfully', () async {
      bool isRegistered =
          await Register("peterelsokhn@gmail.com", "peter", "peterpass");
      expect(isRegistered, false);
    });
  });
}
