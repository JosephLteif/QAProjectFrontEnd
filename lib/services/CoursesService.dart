import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:qa/models/course.dart';
import 'package:qa/state/CourseState.dart';
import 'package:qa/utils/DataHelper.dart';
import 'package:qa/utils/appsettings.dart';
import 'package:qa/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CoursesService{

  var dio = DioModel().getDio();

  Future<void> Courses(String category) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Response result = await dio.post(CoursesUrl, queryParameters: {
        "Tags": category,
      });
      if (result.statusCode == 200) {
        print("----------------------------");
        print(result.data);
        print("----------------------------");
      
        } else {
        throw Exception;
      }
    }catch(e){
      throw(e);
    }
  }
}