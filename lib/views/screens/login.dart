
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:qa/services/LoginService.dart';

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
  Icon firstIcon = const Icon(Icons.visibility);
  Icon secondIcon = const Icon(Icons.visibility_off);

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
                          Container(
                              alignment: Alignment.topCenter,
                              margin: const EdgeInsets.only(
                                  top: 150, right: 30, left: 30),
                              child: TextFormField(
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
                            margin: const EdgeInsets.all(30),
                            child: TextFormField(
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
                            margin: const EdgeInsets.only(bottom: 10),
                            child: TextButton(
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
                                      passwordController.text.toString(),
                                      this.context);
                                      if(response){
                                        
                                      }
                                } catch (e) {
                                  throw e;
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
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: 'By clicking Sign Up, you agree to our '),
                                TextSpan(
                                    text: 'Terms of Service',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('Terms of Service"');
                                      }),
                                TextSpan(text: ' and that you have read our '),
                                TextSpan(
                                    text: 'Privacy Policy',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('Privacy Policy"');
                                      }),
                              ],
                            ),
                          ),
                          const Text(
                            "-OR-",
                            style: TextStyle(fontSize: 16),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: SignInButton(
                                Buttons.Google,
                                text: "Login with Google",
                                onPressed: () async {
                                },
                              ))
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
