import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _otpController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      "Verify your phone number",
                      style: TextStyle(
                        color: tabColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "WhatsApp will send or receive SMS messages to verify your phone number. Standard message and data rates may apply.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: whiteColor, fontSize: 15),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  // otp field
                  _pinCodeWidget()
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "initialProfileSubmitPage");
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: tabColor),
                child: Center(
                    child: const Text("Next",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pinCodeWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          PinCodeFields(
            length: 6,
            controller: _otpController,
            onComplete: (value) {},
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Enter 6-digit code",
            style: TextStyle(color: whiteColor, fontSize: 15),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
