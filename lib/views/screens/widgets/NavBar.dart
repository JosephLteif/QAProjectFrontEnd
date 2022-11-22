import 'package:flutter/material.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:qa/views/screens/HomePage.dart';
import 'package:qa/views/screens/login.dart';
import 'package:qa/views/screens/signup.dart';
import 'package:provider/provider.dart';

import '../Profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  List _pageOptions = [];
  List<String> _pageNames = [];
  List<Icon> _pageIcons = [];
  @override
  void initState() {
    super.initState();
    _pageOptions = [const HomePage(), const HomePage(), const Profile()];
    _pageNames = ['Discover', 'My Courses', 'Profile'];
    _pageIcons = [
      const Icon(
        Icons.home,
      ),
      const Icon(Icons.book),
      const Icon(Icons.person)
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
        builder: (context, theme, _) => MaterialApp(
              theme: theme.getTheme(),
              home: Scaffold(
                  body: _pageOptions[_selectedIndex],
                  bottomNavigationBar: BottomNavigationBar(
                    fixedColor: Colors.deepPurple,
                    items: List.generate(_pageOptions.length, (index) {
                      return BottomNavigationBarItem(
                        // backgroundColor: Colors.purple,
                        icon: _pageIcons[index],
                        label: _pageNames[index],
                      );
                    }),
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                  )),
            ));
  }
}
