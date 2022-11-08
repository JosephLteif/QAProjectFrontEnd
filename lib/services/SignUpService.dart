import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qa/utils/appsettings.dart';

Register(String email, String password,String name,String phoneNumber, BuildContext context) async {
  try {
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response result = await dio.post(RegisterUrl, queryParameters: {
      "Email": email,
      "Name": name,
      "PhoneNumber": phoneNumber,
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
