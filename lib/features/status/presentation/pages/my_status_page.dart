import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as time_ago;
import 'package:whatsapp__clone/features/app/global/widgets/profile_wdiget.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

class MyStatusPage extends StatefulWidget {
  const MyStatusPage({super.key});

  @override
  State<MyStatusPage> createState() => _MyStatusPageState();
}

class _MyStatusPageState extends State<MyStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Status")),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          Row(
            spacing: 15,
            children: [
              Container(
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
              Expanded(
                child: Text(
                  time_ago.format(DateTime.now()
                      .subtract(Duration(seconds: DateTime.now().second))),
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: greyColor.withValues(alpha: 0.5),
                ),
                color: appBarColor,
                iconSize: 28,
                onSelected: (value) {},
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: "Delete",
                      child:
                          GestureDetector(onTap: () {}, child: Text("Delete")),
                    )
                  ];
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}
