import 'package:flutter/material.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';
import 'package:whatsapp__clone/features/call/presentation/pages/calls_history_page.dart';
import 'package:whatsapp__clone/features/chat/presentation/pages/chat_page.dart';
import 'package:whatsapp__clone/features/status/presentation/pages/status_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);

    _tabController!.addListener(() {
      setState(() {
        _currentTabIndex = _tabController!.index;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
            labelColor: tabColor,
            unselectedLabelColor: greyColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: tabColor,
            controller: _tabController,
            tabs: [
              Tab(
                child: Text(
                  "Chats",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
                child: Text(
                  "Status",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
                child: Text(
                  "Calls",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ]),
        backgroundColor: appBarColor,
        title: const Text(
          "Whatsapp",
          style: TextStyle(
              fontSize: 25, color: greyColor, fontWeight: FontWeight.w600),
        ),
        actions: [
          Icon(
            Icons.camera_alt_outlined,
            color: greyColor,
            size: 28,
          ),
          const SizedBox(
            width: 25,
          ),
          Icon(
            Icons.search,
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

                      Navigator.pushNamed(context, 'settingsPage');
                    },
                    child: Text("Settings")),
              ),
            ],
          )
        ],
      ),
      floatingActionButton:
          switchFloatingActionButtonOnTabIndex(_currentTabIndex),
      body: Container(
        child: TabBarView(
          controller: _tabController,
          children: [ChatPage(), StatusPage(), CallsHistoryPage()],
        ),
      ),
    );
  }

  switchFloatingActionButtonOnTabIndex(int index) {
    switch (index) {
      case 0:
        return FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'contactUsersPage');
          },
          backgroundColor: tabColor,
          shape: const CircleBorder(),
          child: Center(
            child: Icon(
              Icons.message,
              color: whiteColor,
            ),
          ),
        );

      case 1:
        return FloatingActionButton(
          onPressed: () {},
          backgroundColor: tabColor,
          shape: const CircleBorder(),
          child: Center(
            child: Icon(
              Icons.camera_alt_outlined,
              color: whiteColor,
            ),
          ),
        );
      case 2:
        return FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "callContactsPage");
          },
          backgroundColor: tabColor,
          shape: const CircleBorder(),
          child: Center(
            child: Icon(
              Icons.add_call,
              color: whiteColor,
            ),
          ),
        );
      default:
        return FloatingActionButton(
          onPressed: () {},
          backgroundColor: tabColor,
          shape: const CircleBorder(),
          child: Center(
            child: Icon(
              Icons.message,
              color: whiteColor,
            ),
          ),
        );
    }
  }
}
