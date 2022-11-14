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
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
              title:const Text("SignUp"),
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
                                  top: 100, right: 30, left: 30),
                              child: TextFormField(
                                key: const Key("name"),
                                validator: validateName,
                                controller: nameController,
                                cursorHeight: 20,
                                autofocus: false,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  labelText: 'Name',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: Colors.grey),
                                  ),
                                ),
                              )),
                          Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.only(
                              top: 20, right: 30, left: 30),
                          child: TextFormField(
                            key: const Key("email"),
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
                            margin: const EdgeInsets.only(top:20,right:30,left:30),
                            child: TextFormField(
                              key: const Key("password"),
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
                              key: const Key("Signupbtn"),
                              style: theme.getTheme().textButtonTheme.style,
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
                                      if(response){
                                        Navigator.push(context,MaterialPageRoute(
                                        builder: (context) => SignIn()));
                                      }
                                      else{
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
  String? validateName(String? formName) {
    if (formName == null || formName.isEmpty) {
      return 'Name is required.';
    }
    String pattern = '^[a-zA-Z0-9_ ]*';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formName)) return 'Name can only include words';
    return null;
  }
  