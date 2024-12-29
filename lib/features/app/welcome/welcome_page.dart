import 'package:flutter/material.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Text(
                  "Welcome to WhatsApp Clone",
                  style: TextStyle(
                      color: tabColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Image.asset("assets/bg_image.png"),
              Text(
                  "Read our Privacy Policy Tab, 'Agree and Continue' to accept the Team of Service.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "loginPage", (route) => false);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: tabColor),
                  child: Text(
                    "Agree and Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
