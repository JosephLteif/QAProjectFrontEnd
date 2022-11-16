import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qa/services/LoginService.dart';
import 'package:qa/utils/handling.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:qa/services/SignUpService.dart';
import 'package:qa/views/screens/login.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Register"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Form(
                key: _key,
                child: Stepper(
                  currentStep: _index,
                  onStepCancel: () {
                    if (_index > 0) {
                      setState(() {
                        _index -= 1;
                      });
                    }
                  },
                  onStepContinue: () {
                    if (_index <= 0) {
                      setState(() {
                        _index += 1;
                      });
                    }
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _index = index;
                    });
                  },
                  steps: [
                    Step(
                      state: _index! >= 0
                          ? (_index! == 0
                              ? StepState.editing
                              : StepState.complete)
                          : StepState.indexed,
                      title: const Text("Step 1"),
                      content: TextFormField(
                        key: const Key("Name"),
                        validator: validateName,
                        controller: nameController,
                        cursorHeight: 20,
                        autofocus: false,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF343434),
                          prefixIcon: Icon(Icons.person, color: Colors.grey),
                          border: InputBorder.none,
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Step(
                      state: _index! >= 1
                          ? (_index! == 1
                              ? StepState.editing
                              : StepState.complete)
                          : StepState.indexed,
                      title: const Text("Step 2"),
                      content: Column(
                        children: [
                          TextFormField(
                            key: const Key("Email"),
                            validator: validateEmail,
                            controller: emailController,
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF343434),
                              prefixIcon: Icon(Icons.email, color: Colors.grey),
                              border: InputBorder.none,
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            key: const Key("Password"),
                            validator: validatePassword,
                            controller: passwordController,
                            cursorHeight: 20,
                            autofocus: false,
                            obscureText: true,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF343434),
                              prefixIcon:
                                  Icon(Icons.password, color: Colors.grey),
                              border: InputBorder.none,
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            key: const Key("Signupbtn"),
                            onPressed: () async {
                              if (!_key.currentState!.validate()) {
                                return;
                              }
                              FocusScope.of(context).unfocus();

                              setState(() {});
                              try {
                                bool response = await Register(
                                    emailController.text.toString(),
                                    passwordController.text.toString(),
                                    nameController.text.toString());
                                if (response) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                } else {
                                  Handling().failSignup();
                                }
                              } catch (e) {
                                Handling().failSignup();
                              }
                              setState(() {});
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail address is required.';
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Password is required.';
  }
  return null;
}

String? validateName(String? formName) {
  if (formName == null || formName.isEmpty) {
    return 'Name is required.';
  }
  String pattern = '^[a-zA-Z0-9_ ]*';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formName)) return 'Name can only include words';
  return null;
}
