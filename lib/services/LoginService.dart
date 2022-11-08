import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qa/utils/appsettings.dart';
import 'package:shared_preferences/shared_preferences.dart';

Login(String email, String password, BuildContext context) async {
  try {
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response result = await dio.get(LoginUrl, queryParameters: {
      "Email": email,
      "Password": password,
    });
    if (result.statusCode == 200) {
      var resultData = result.data;
      prefs.setBool('IsLoggedIn', true);
      return true;
    } else {
    }
  } catch (e) {
    throw e;
  }
}
