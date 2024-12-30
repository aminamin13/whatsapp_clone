import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({super.key});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final TextEditingController _textMessageController = TextEditingController();

  bool _isDisplaySendButton = false;

  bool _isShowAttachWindow = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _textMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "Online",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.videocam_rounded,
            color: greyColor,
            size: 28,
          ),
          const SizedBox(
            width: 25,
          ),
          Icon(
            Icons.call,
            color: greyColor,
            size: 28,
          ),
          const SizedBox(
            width: 10,
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: greyColor,
              size: 28,
            ),
            color: appBarColor,
            iconSize: 28,
            onSelected: (value) {},
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: "Settings",
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);

                      // Navigator.pushNamed(context, 'settingsPage');
                    },
                    child: Text("Settings")),
              ),
            ],
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isShowAttachWindow = false;
          });
        },
        child: Stack(
          children: [
            Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/whatsapp_bg_image.png",
                  fit: BoxFit.cover,
                )),
            Column(
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    _messageLayout(
                      message: "hello",
                      alignment: Alignment.centerRight,
                      createAt: Timestamp.now(),
                      isSeen: false,
                      isShowTick: true,
                      messageBgColor: messageColor,
                      onLongPress: () {},
                      onSwipe: (details) {},
                    ),
                    _messageLayout(
                      message: "how are you",
                      alignment: Alignment.centerRight,
                      createAt: Timestamp.now(),
                      isSeen: false,
                      isShowTick: true,
                      messageBgColor: messageColor,
                      onLongPress: () {},
                      onSwipe: (details) {},
                    ),
                    _messageLayout(
                      message: "hello",
                      alignment: Alignment.centerLeft,
                      createAt: Timestamp.now(),
                      isSeen: false,
                      isShowTick: false,
                      messageBgColor: senderMessageColor,
                      onLongPress: () {},
                      onSwipe: (details) {},
                    ),
                    _messageLayout(
                      message: "I am fine",
                      alignment: Alignment.centerLeft,
                      createAt: Timestamp.now(),
                      isSeen: false,
                      isShowTick: false,
                      messageBgColor: senderMessageColor,
                      onLongPress: () {},
                      onSwipe: (details) {},
                    )
                  ],
                )),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
                  child: Row(children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                          controller: _textMessageController,
                          onTap: () {
                            setState(() {
                              _isShowAttachWindow = false;
                            });
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                _isDisplaySendButton = true;
                                _isShowAttachWindow = false;
                              });
                            } else {
                              setState(() {
                                _isDisplaySendButton = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15),
                              border: InputBorder.none,
                              hintText: "Message",
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Wrap(
                                  children: [
                                    Transform.rotate(
                                      angle: -0.5,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isShowAttachWindow =
                                                !_isShowAttachWindow;
                                          });
                                        },
                                        child: Icon(
                                          Icons.attach_file,
                                          color: greyColor,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.camera_alt,
                                      color: greyColor,
                                      size: 25,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.emoji_emotions,
                                color: greyColor,
                                size: 30,
                              ))),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: tabColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              _isDisplaySendButton ? Icons.send : Icons.mic,
                              color: whiteColor,
                            ),
                          )),
                    )
                  ]),
                )
              ],
            ),
            _isShowAttachWindow == true
                ? Positioned(
                    bottom: 65,
                    top: 360,
                    left: 15,
                    right: 15,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.1,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                      decoration: BoxDecoration(
                          color: bottomAttachContainerColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _attachWindowItem(
                                icon: Icons.document_scanner,
                                color: Colors.deepPurpleAccent,
                                title: "Document",
                              ),
                              _attachWindowItem(
                                  icon: Icons.camera_alt,
                                  color: Colors.pinkAccent,
                                  title: "Camera",
                                  onTap: () {}),
                              _attachWindowItem(
                                  icon: Icons.image,
                                  color: Colors.purpleAccent,
                                  title: "Gallery"),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _attachWindowItem(
                                  icon: Icons.headphones,
                                  color: Colors.deepOrange,
                                  title: "Audio"),
                              _attachWindowItem(
                                  icon: Icons.location_on,
                                  color: Colors.green,
                                  title: "Location"),
                              _attachWindowItem(
                                  icon: Icons.account_circle,
                                  color: Colors.deepPurpleAccent,
                                  title: "Contact"),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _attachWindowItem(
                                  icon: Icons.bar_chart,
                                  color: tabColor,
                                  title: "Poll",
                                ),
                                _attachWindowItem(
                                  icon: Icons.gif_box_outlined,
                                  color: Colors.indigoAccent,
                                  title: "Gif",
                                ),
                                _attachWindowItem(
                                  icon: Icons.videocam_rounded,
                                  color: Colors.lightGreen,
                                  title: "Video",
                                )
                              ]),
                        ],
                      ),
                    ))
                : Container(),
          ],
        ),
      ),
    );
  }

  _attachWindowItem(
      {IconData? icon, Color? color, String? title, VoidCallback? onTap}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                color: whiteColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title!,
          style: TextStyle(color: greyColor, fontSize: 12),
        )
      ],
    );
  }

  _messageLayout(
      {Color? messageBgColor,
      Alignment? alignment,
      Timestamp? createAt,
      Function(DragUpdateDetails)? onSwipe,
      //double? rightPadding,
      String? message,
      bool? isShowTick,
      bool? isSeen,
      VoidCallback? onLongPress}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SwipeTo(
        onRightSwipe: onSwipe,
        child: GestureDetector(
          onLongPress: onLongPress,
          child: Container(
            alignment: alignment,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(
                          left: 5, right: 85, top: 5, bottom: 5),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8),
                      decoration: BoxDecoration(
                          color: messageBgColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$message",
                            style: TextStyle(fontSize: 16, color: whiteColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
                Positioned(
                    right: 10,
                    bottom: 4,
                    child: Row(
                      children: [
                        Text(DateFormat.jm().format(createAt!.toDate()),
                            style: TextStyle(
                                color: lightGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                        SizedBox(
                          width: 3,
                        ),
                        isShowTick == true
                            ? Icon(
                                isSeen == true ? Icons.done_all : Icons.done,
                                size: 16,
                                color: isSeen == true
                                    ? Colors.blue
                                    : lightGreyColor,
                              )
                            : Container(),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
