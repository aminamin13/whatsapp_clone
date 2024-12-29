import 'package:flutter/material.dart';
import 'package:whatsapp__clone/features/app/const/page_const.dart';
import 'package:whatsapp__clone/features/app/home/contacts_page.dart';
import 'package:whatsapp__clone/features/app/home/home_page.dart';
import 'package:whatsapp__clone/features/app/settings/settings_page.dart';
import 'package:whatsapp__clone/features/status/presentation/pages/my_status_page.dart';
import 'package:whatsapp__clone/features/user/presentation/pages/initial_profile_submit_page.dart';
import 'package:whatsapp__clone/features/user/presentation/pages/login_page.dart';
import 'package:whatsapp__clone/features/user/presentation/pages/otp_page.dart';

class OnGenerateRoutes {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      case PageConst.loginPage:
        {
          return materialPageBuilder(const LoginPage());
        }
      case PageConst.otpPage:
        {
          return materialPageBuilder(const OtpPage());
        }
      case PageConst.initialProfileSubmitPage:
        {
          return materialPageBuilder(const InitialProfileSubmitPage());
        }
      case PageConst.homePage:
        {
          return materialPageBuilder(const HomePage());
        }
         case PageConst.contactUsersPage:
        {
          return materialPageBuilder(const ContactsPage());
        }
      case PageConst.settingsPage:
        {
          return materialPageBuilder(const SettingsPage());
        }
      // case PageConst.callContactsPage:
      //   {
      //     return materialPageBuilder(const CallContactsPage());
      //   }
      case PageConst.myStatusPage:
        {
          return materialPageBuilder(const MyStatusPage());
        }
      // case PageConst.singleChatPage:
      //   {
      //     return materialPageBuilder(const SingleChatPage());
      //   }
    }
    return null;
  }
}

dynamic materialPageBuilder(Widget page) {
  return MaterialPageRoute(builder: (context) => page);
}
