import 'package:flutter/material.dart';
import 'package:whatsapp__clone/features/app/global/widgets/profile_wdiget.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

class CallContactsPage extends StatefulWidget {
  const CallContactsPage({super.key});

  @override
  State<CallContactsPage> createState() => _CallContactsPageState();
}

class _CallContactsPageState extends State<CallContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Contacts")),
      body: ListView.builder(
          itemBuilder: (context, index) => ListTile(
                leading: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: profileWidget(),
                  ),
                ),
                title: Text(
                  "User ${index + 1}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "Hey there, I am using whatsApp",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: greyColor, fontSize: 13),
                ),
                trailing: Wrap(
                  spacing: 15,
                  children: [
                    Icon(
                      Icons.call,
                      color: tabColor,
                      size: 27,
                    ),
                    Icon(
                      Icons.videocam_rounded,
                      color: tabColor,
                      size: 27,
                    ),
                  ],
                ),
              ),
          itemCount: 6),
    );
  }
}
