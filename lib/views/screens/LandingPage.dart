import 'package:flutter/gestures.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:qa/views/screens/login.dart';
import 'package:qa/views/screens/signup.dart';

class MyLandingPage extends StatefulWidget {
  const MyLandingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyLandingPage> createState() => _MyLandingPageState();
}

class _MyLandingPageState extends State<MyLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Spacer(),
          Hero(
            tag: 'PlatformName',
            child: Container(
              // padding: EdgeInsets.all(100), //You can use EdgeInsets like above
              alignment: Alignment.center,
              child: const Image(
                image: AssetImage("assets/images/logo.png"),
                height: 200,
                width: 200,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () async {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignIn()))
                    .then((value) => setState(() {}));
              },
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
