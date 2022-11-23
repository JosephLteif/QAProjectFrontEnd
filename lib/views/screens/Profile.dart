import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qa/utils/settings_prefs.dart';

import '../../Providers/UserProvider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProvider, SettingsNotifier>(
      builder: (context, userProvider, settingsProvider, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(fontSize: 32),
                    ),
                    IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: ((context) => Notifications())));
                        },
                        icon: const Icon(Icons.menu))
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        maxRadius: 40,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        userProvider.user.name.toString(),
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        userProvider.user.email.toString(),
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  )
                ]),
                const SizedBox(
                  height: 28,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.deepPurple,
                ),
                const SizedBox(
                  height: 28,
                ),
                Expanded(
                  // height: 50,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Option 1"),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.deepPurple,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Dark Mode"),
                          Switch(
                            value: settingsProvider.getThemeMode(),
                            onChanged: (value) {
                              settingsProvider.ToggleTheme();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
