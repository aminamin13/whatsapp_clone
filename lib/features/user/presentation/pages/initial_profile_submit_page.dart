import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp__clone/features/app/const/app_const.dart';
import 'package:whatsapp__clone/features/app/global/widgets/profile_wdiget.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

class InitialProfileSubmitPage extends StatefulWidget {
  const InitialProfileSubmitPage({super.key});

  @override
  State<InitialProfileSubmitPage> createState() =>
      _InitialProfileSubmitPageState();
}

class _InitialProfileSubmitPageState extends State<InitialProfileSubmitPage> {
  final TextEditingController _usernameController = TextEditingController();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Text("Profile Info",
                style: TextStyle(
                    fontSize: 20,
                    color: tabColor,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Please provide your name and optional profile picture.",
            textAlign: TextAlign.center,
            style: TextStyle(color: whiteColor, fontSize: 15),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: openBottomSheet,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: profileWidget(image: _image),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: tabColor, width: 1.5),
            )),
            child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(hintText: "Username")),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "homePage", (_) => false);
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
    ));
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    try {
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        toast("No Image Selected");
      }
    } catch (e) {
      toast("Failed to pick image: $e");
    }
  }

  Future openBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text("Please choose an option",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  color: tabColor,
                ),
                title: const Text("Camera",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: tabColor,
                ),
                title: const Text("Gallery",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
