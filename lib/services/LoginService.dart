import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qa/utils/appsettings.dart';
import 'package:qa/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Login(String email, String password) async {
  try {
    
    var dio = DioModel().getDio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
        Response result = await dio.post(LoginUrl, queryParameters: {
      "Email": email,
      "Password": password,
    });
    if (result.statusCode == 200) {
      prefs.setBool("isLoggedin", true);
      prefs.setString("token", result.data);
      return true;
    }else {
      return false;
    }
  } catch (e) {
    throw e;
  }
}


