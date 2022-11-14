import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Handling{
  SuccessToast() {
  return Fluttertoast.showToast(
    msg: "Login Successfull",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.white,
    textColor: Colors.black87,
    fontSize: 16.0);
}

FailedToast() {
  return Fluttertoast.showToast(
    msg: "Login Failed",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.white,
    textColor: Colors.black87,
    fontSize: 16.0);
}

failLogin() {
  FailedToast();
  return false;
}
failSignup(){
   return Fluttertoast.showToast(
    msg: "Sign Up Failed",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.white,
    textColor: Colors.black87,
    fontSize: 16.0);
}
}