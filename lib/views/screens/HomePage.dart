import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:provider/provider.dart';
import 'package:qa/utils/settings_prefs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
  return Consumer<SettingsNotifier>(
        builder: (context, theme, _) => MaterialApp(
          theme: theme.getTheme(),
          home: Scaffold(
            appBar: AppBar(
              title: const Text("Discover"),
               actions: [
                IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: ((context) => Notifications())));
                  },
                  icon: const Icon(Icons.notifications))
              ],
          ),
          body: Scaffold(
              body: SafeArea(
            //by default scroll directioin is vertical
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.only(top:16,left:16,right: 16),     
                          width: MediaQuery.of(context).size.width/2,
                          height: MediaQuery.of(context).size.height /4, 
                        child: const  TextField(
                          cursorHeight: 20,
                          autofocus: false,
                          decoration:   InputDecoration(
                            suffix: Icon(Icons.search, color: Colors.grey),
                            border: OutlineInputBorder(),
                            labelText: 'Search',
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                         ),
                      )
                      ],
                    ),

                  ],
                )
                // ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   padding: const EdgeInsets.all(8),
                //   itemCount: entries.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Card(
                //       color: Colors.amber[colorCodes[index]],
                //       child: Center(child: Text('Entry ${entries[index]}')),
                //     );
                //   }
                // ),
               ),
              )),
    ));
  }
}