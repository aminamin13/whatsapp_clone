import 'package:flutter/material.dart';
import 'package:whatsapp__clone/features/app/global/date/date_formats.dart';
import 'package:whatsapp__clone/features/app/global/widgets/profile_wdiget.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

class CallsHistoryPage extends StatelessWidget {
  const CallsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Text(
              "Recent",
              style: TextStyle(
                  fontSize: 15, color: greyColor, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
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
                  subtitle: Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.call_made, color: tabColor, size: 19),
                      Text(formatDateTime(DateTime.now())),
                    ],
                  ),
                  trailing: Icon(Icons.call, color: tabColor),
                );
              },
              itemCount: 10)
        ],
      ),
    ));
  }
}
