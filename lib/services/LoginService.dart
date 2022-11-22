import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:qa/utils/appsettings.dart';
import 'package:qa/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/UserProvider.dart';
import '../models/User.dart';

Future<User> Login(String email, String password) async {
  try {
    var dio = DioModel().getDio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response result = await dio.post(LoginUrl, queryParameters: {
      "Email": email,
      "Password": password,
    });
    if (result.statusCode == 200) {
      prefs.setBool("isLoggedin", true);
      prefs.setString("token", result.data["token"]);
      User user = User.fromJson(result.data["user"]);
      // Provider.of<UserProvider>(listen: false).setUser(user);
      return user;
    } else {
      throw Exception;
    }
  } catch (e) {
    throw e;
  }
}
