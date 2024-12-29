import 'package:flutter/material.dart';
import 'package:whatsapp__clone/features/app/welcome/welcome_page.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Image.asset("assets/whats_app_logo.png",
              color: whiteColor, width: 100, height: 100),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/meta.png",
                color: whiteColor,
                width: 35,
                height: 35,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Meta",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
