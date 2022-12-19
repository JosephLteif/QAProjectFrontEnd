import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qa/models/sessions.dart';

class SessionTile extends StatelessWidget {
   Session session;
   int num;
  SessionTile({Key? key, required this.session, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(num.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
      title: Text(session.name.toString()),
      subtitle: Text("${session.length} mins", style: TextStyle(fontSize: 10,fontStyle: FontStyle.italic),),
      trailing: const Icon(
            Icons.arrow_right,
            color: Colors.purple,
            size: 30,
          ),

    );
  }
}