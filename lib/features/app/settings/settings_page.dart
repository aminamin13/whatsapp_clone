import 'package:flutter/material.dart';
import 'package:whatsapp__clone/features/app/global/widgets/profile_wdiget.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(spacing: 10, children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: profileWidget(),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amine",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "My status",
                      style: TextStyle(color: greyColor, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.qr_code_sharp,
                color: tabColor,
                size: 30,
              )
            ]),
          ),
          SizedBox(
            height: 5,
          ),
          const Divider(),
          SizedBox(
            height: 10,
          ),
          _settingsItemWidget(
            title: "Account",
            description: "Security applications, change number",
            icon: Icons.key,
            onTap: () {},
          ),
          _settingsItemWidget(
            title: "Privacy",
            description: "Block contacts, disappearing messages",
            icon: Icons.lock,
            onTap: () {},
          ),
          _settingsItemWidget(
            title: "Chats",
            description: "Theme, wallpapers, chat history",
            icon: Icons.chat,
            onTap: () {},
          ),
          _settingsItemWidget(
            title: "Logout",
            description: "Logout from this device",
            icon: Icons.exit_to_app,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  GestureDetector _settingsItemWidget(
      {String? title,
      String? description,
      IconData? icon,
      VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
              width: 80,
              height: 80,
              child: Icon(icon, color: greyColor, size: 30)),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  description!,
                  style: TextStyle(color: greyColor, fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
