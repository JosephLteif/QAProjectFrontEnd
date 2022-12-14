import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:qa/views/screens/HomePage.dart';
import 'package:qa/views/screens/login.dart';
import 'package:qa/views/screens/LandingPage.dart';
import 'package:qa/views/screens/widgets/NavBar.dart';

import 'Providers/UserProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(ChangeNotifierProvider<SettingsNotifier>(
    create: (_) => SettingsNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    FirebaseMessaging _fcm = FirebaseMessaging.instance;
//    PushNotificationService(_fcm).initialise(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsNotifier>(
            create: (context) => SettingsNotifier()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
      ],
      child: Consumer<SettingsNotifier>(
        builder: (context, value, child) => MaterialApp(
          theme: value.getTheme(),
          home: const MyLandingPage(title: 'TeachMe'),
        ),
      ),
    );
  }
}
