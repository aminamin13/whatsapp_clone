import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';

Widget profileWidget({String? imageUrl, File? image}) {
  if (image == null) {
    if (imageUrl == null || imageUrl == "") {
      return ClipOval(
        child: Image.asset(
          "assets/profile_default.png",
          fit: BoxFit.cover,
        ),
      );
    } else {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, progress) {
            return CircularProgressIndicator(
              color: tabColor,
            );
          },
          errorWidget: (context, url, error) => Image.asset(
            "assets/profile_default.png",
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  } else {
    return ClipOval(
      child: Image.file(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
