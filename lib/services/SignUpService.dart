import 'dart:io';
import 'package:qa/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qa/utils/appsettings.dart';

Register(String email, String password,String name) async {
  try {
    
    var dio = DioModel().getDio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response result = await dio.post(RegisterUrl, queryParameters: {
      "Email": email,
      "Password": password,
    });

    if (result.statusCode == 200) {
      var resultData = result.data;
      prefs.setBool('IsLoggedIn', true);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
