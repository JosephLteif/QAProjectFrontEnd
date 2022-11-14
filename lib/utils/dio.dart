import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioModel{
  static final DioModel _DioModel = DioModel._internal();
  static final Dio dio =Dio();
 
 
 getDio(){
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return null;
    }; 
    return dio; 
  }
  factory DioModel() {
    return _DioModel;
  }

  DioModel._internal();
    
}