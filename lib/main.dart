import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/ui/screens/splash_screen.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.primary,
    systemNavigationBarColor: AppColor.black
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SplashScreen.routeName: (_) => const SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
      home: const HomeScreen(),
      title: "News App",

    );
  }
}
