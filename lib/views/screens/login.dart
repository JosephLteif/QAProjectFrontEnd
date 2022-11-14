import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qa/utils/handling.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:qa/services/LoginService.dart';
import 'package:qa/views/screens/HomePage.dart';
import 'package:qa/views/screens/widgets/NavBar.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignIn();

   Widget wrapWithMaterial() => MaterialApp(
    home: ListenableProvider<SettingsNotifier>(
      create: (_) => SettingsNotifier(),
      child: Scaffold(
        body: this,
      ),
    ),
  );
}

class _SignIn extends State<SignIn> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String errorMessage = '';

  bool _obscureText = true;
  Icon firstIcon = const Icon(Icons.visibility,color: Colors.grey,);
  Icon secondIcon = const Icon(Icons.visibility_off, color: Colors.grey);

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
     return Consumer<SettingsNotifier>(
        builder: (context, theme, _) => MaterialApp(
          theme: theme.getTheme(),
          home: Scaffold(
            appBar: AppBar(
              title: Text("Login"),
                 leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    // color: Colors.black54,
                  ),
            ),
          ),
        
        body: GestureDetector(
          child: Form(
            key: _key,
            child: Scaffold(
              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: IntrinsicHeight(
                          child: Column(
                        children: [
                          // Container(
                          //     alignment: Alignment.topCenter,
                          //     margin: const EdgeInsets.only(
                          //         top: 150, right: 30, left: 30),
                          //     // ignore: prefer_const_constructors
                          //     child: Image(
                          //       image: const AssetImage("assets/images/logo.png"),
                          //       height: 90,
                          //       width: 90,
                          //     )                           
                          // ),
                          Container(
                              alignment: Alignment.topCenter,
                              margin: const EdgeInsets.only(
                                  top: 150, right: 30, left: 30),
                              child: TextFormField(
                                key: const Key("Email"),
                                validator: validateEmail,
                                controller: emailController,
                                cursorHeight: 20,
                                autofocus: false,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: Colors.grey),
                                  ),
                                ),
                              )),
                          Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(top:30,right:30,left:30),
                            child: TextFormField(
                              key: const Key("Password"),
                              controller: passwordController,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                                  labelStyle: const TextStyle(color: Colors.grey),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: Colors.grey),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: _obscureText ? firstIcon : secondIcon,
                                    onPressed: () {
                                      _toggle();
                                    },
                                  )),
                              validator: validatePassword,
                              obscureText: _obscureText,
                            ),
                          ),
                          Text(
                            errorMessage,
                            style: const TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.normal),
                          ),
                          Container(
                             alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(right: 30, left: 30),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.blue, fontSize: 12.0,fontStyle: FontStyle.italic),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Forgot password',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print('Terms of Service"');
                                        }),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: TextButton(
                              key: const Key("Loginbtn"),
                              style: theme.getTheme().textButtonTheme.style,
                              onPressed: () async {
                             if (!_key.currentState!.validate()) {
                                  return;
                                }
                                FocusScope.of(context).unfocus();
                                setState(() {});
                                try {
                                  bool response = await Login(
                                      emailController.text.toString(),
                                      passwordController.text.toString());
                                      if(response){
                                        // ignore: use_build_context_synchronously
                                        Navigator.push(context,MaterialPageRoute(
                                        builder: (context) => const NavBar()));
                                      }
                                      else{
                                        Handling().FailedToast();
                                      }
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
                          ),

                        ],
                      )),
              ),
            ),
        )),
        )));
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


