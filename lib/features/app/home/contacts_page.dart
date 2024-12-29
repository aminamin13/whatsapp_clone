import 'package:flutter/material.dart';
import 'package:whatsapp__clone/features/app/global/widgets/profile_wdiget.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

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
                style: TextStyle(color: greyColor, fontSize: 13),
              )),
          itemCount: 20),
    );
  }
}
