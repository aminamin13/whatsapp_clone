import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp__clone/features/app/global/widgets/profile_wdiget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return ListTile(
          leading: SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: profileWidget(),
              )),
          title: Text("Username"),
          subtitle: Text(
            "last message hi",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            DateFormat.jm().format(DateTime.now()),
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        );
      },
    ));
  }
}
