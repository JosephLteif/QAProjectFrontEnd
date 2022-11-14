import 'package:flutter/material.dart';
import 'package:qa/utils/settings_prefs.dart';
import 'package:qa/views/screens/HomePage.dart';
import 'package:qa/views/screens/login.dart';
import 'package:qa/views/screens/signup.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  late List _pageOptions = [];
  @override
  void initState() {
    super.initState();
    // database.getUser("FQ74oZhuNYRI2H9HMf3hLC98x5a2");
    _pageOptions = [const HomePage(),const SignIn(),const SignUp()];
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
          home:Scaffold(
          body: _pageOptions[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.deepPurple,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                // backgroundColor: Colors.purple,
                icon: Icon(
                  Icons.search,
                ),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'My Courses ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          )),
    ));
  }
}