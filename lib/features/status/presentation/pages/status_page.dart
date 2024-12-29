import 'package:flutter/material.dart';
import 'package:whatsapp__clone/features/app/global/date/date_formats.dart';
import 'package:whatsapp__clone/features/app/global/widgets/profile_wdiget.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(12.5),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: profileWidget(),
                  ),
                  Positioned(
                      right: 10,
                      bottom: 8,
                      child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              border: Border.all(color: blackColor, width: 2),
                              shape: BoxShape.circle,
                              color: tabColor),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                            ),
                          )))
                ],
              ),
              Expanded(
                child: Column(
                  spacing: 2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Status",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text("Tap to add status update",
                        style: TextStyle(color: greyColor, fontSize: 16))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "myStatusPage");
                },
                child: Icon(
                  Icons.more_horiz,
                  color: greyColor.withValues(alpha: 0.5),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Recent Updates",
              style: TextStyle(
                  color: greyColor, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
              itemCount: 20,
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(formatDateTime(DateTime.now())));
              })
        ],
      ),
    ));
  }
}
