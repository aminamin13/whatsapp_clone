import 'package:flutter/material.dart';
import 'package:whatsapp__clone/features/app/splash/splash_screen.dart';
import 'package:whatsapp__clone/features/app/theme/style.dart';
import 'package:whatsapp__clone/routes/on_generate_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          dialogBackgroundColor: appBarColor,
          appBarTheme: const AppBarTheme(color: appBarColor)),
      onGenerateRoute: OnGenerateRoutes.route,
      routes: {
        "/": (context) => const SplashScreen(),
      },
      initialRoute: "/",
    );
  }
}
