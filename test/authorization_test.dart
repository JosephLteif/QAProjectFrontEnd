import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:qa/main.dart';
import 'package:qa/services/LoginService.dart';
import 'package:qa/services/SignUpService.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:qa/views/screens/login.dart';


void main() {

  group('Login', () {
    test('User logged in successfully', () async {
      bool isLoggedIn = await Login("l@dev.com", "password");
      expect(isLoggedIn, true);
    });

    test('User logged in unsuccessfully', () async {
      bool isLoggedIn = await Login("whateverwhat@gmail.com", "peter11pass");
      expect(isLoggedIn, false);
    });
  });

  group('Register', () {
    test('User registered successfully', () async {
      bool isRegistered =
         await Register("peter11@gmail.com", "peter11pass", "peter11");
      expect(isRegistered, true);
    });

    test('User registered unsuccessfully', () async {
      bool isRegistered =
         await Register("peter", "peter11pass", "peter11");
      expect(isRegistered, false);
    });
  });
}
