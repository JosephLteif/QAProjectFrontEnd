import 'package:flutter/gestures.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:qa/views/screens/login.dart';
import 'package:qa/views/screens/signup.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return Consumer<SettingsNotifier>(
        builder: (context, theme, _) => MaterialApp(
      title: 'Flutter Demo',
      theme: theme.getTheme(),
      home: const MyLandingPage(title: 'TeachMe'),
   ));
  }
}

class MyLandingPage extends StatefulWidget {
  const MyLandingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyLandingPage> createState() => _MyLandingPageState();
}

class _MyLandingPageState extends State<MyLandingPage> {

  @override
  Widget build(BuildContext context) {
     return Consumer<SettingsNotifier>(
        builder: (context, theme, _) => MaterialApp(
          theme: theme.getTheme(),
          home: Scaffold(
        body:  Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            // padding: EdgeInsets.all(100), //You can use EdgeInsets like above
            margin: const EdgeInsets.only(top: 250),
            alignment: Alignment.center,
            child: const Text(
              "TeachMe",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 250),
            padding: const EdgeInsets.all(8),
            // alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 90),
                    height: 40,
                    width: 220,
                    child: TextButton(
                      onPressed: () async {
                         Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()))
                            .then((value) => setState(() {
                                  // setView();
                                }));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top:10,right: 30, left: 145),
                      child: RichText(
                      text: TextSpan(
                        
                        children: <TextSpan>[
                          TextSpan(
                            style: const TextStyle(color: Colors.purple, fontSize: 16.0,fontStyle: FontStyle.italic),
                            text: 'Sign Up',
                            recognizer: TapGestureRecognizer()
                            ..onTap = () {
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()))
                            .then((value) => setState(() {
                                  // setView();
                                }));
                              print('Terms of Service"');
                          }),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    )))));
  }
}