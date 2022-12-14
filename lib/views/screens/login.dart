import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qa/utils/handling.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:provider/provider.dart';
import 'package:qa/services/LoginService.dart';
import 'package:qa/views/screens/signup.dart';
import 'package:qa/views/screens/widgets/NavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Providers/UserProvider.dart';
import '../../models/User.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String errorMessage = '';

  bool _obscureText = true;
  Icon firstIcon = const Icon(
    Icons.visibility,
    color: Colors.grey,
  );
  Icon secondIcon = const Icon(Icons.visibility_off, color: Colors.grey);

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<SettingsNotifier, UserProvider>(
      builder: (context, value, userProvider, _) => Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: _key,
          child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Spacer(),
                    const Hero(
                      tag: 'PlatformName',
                      child: Image(
                        image: AssetImage("assets/images/logo.png"),
                        height: 200,
                        width: 200,
                      ),
                    ),
                    TextFormField(
                      key: const Key("Email"),
                      validator: validateEmail,
                      controller: emailController,
                      cursorHeight: 20,
                      autofocus: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: const Key("Password"),
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: _obscureText ? firstIcon : secondIcon,
                            onPressed: () {
                              _toggle();
                            },
                          )),
                      validator: validatePassword,
                      obscureText: _obscureText,
                    ),
                    Text(
                      errorMessage,
                      style: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.normal),
                    ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 12.0,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      key: const Key("Loginbtn"),
                      onPressed: () async {
                        if (!_key.currentState!.validate()) {
                          return;
                        }
                        FocusScope.of(context).unfocus();
                        setState(() {});
                        try {
                          User response = await Login(
                              emailController.text.toString(),
                              passwordController.text.toString());
                          userProvider.setUser(response);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavBar()));
                        } catch (e) {
                          Handling().FailedToast();
                        } finally {
                          emailController.text = "";
                          passwordController.text = "";
                        }
                        setState(() {});
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("New to TeachMe?"),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
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
