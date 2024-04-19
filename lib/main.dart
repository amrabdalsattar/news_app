import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/ui/screens/details_screen/details_screen.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/ui/screens/splash_screen.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initFirebase();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.primary,
      systemNavigationBarColor: AppColor.black));
  runApp(const MyApp());
}

Future<void> _initFirebase() async {
  final options = DefaultFirebaseOptions.currentPlatform;

  try {
    final app = await Firebase.initializeApp(options: options);
    FirebaseFirestore.instance.settings =
        const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
    debugPrint(app.name);
    await FirebaseFirestore.instance.disableNetwork();
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SplashScreen.routeName: (_) => const SplashScreen(),
        DetailsScreen.routeName: (_) => const DetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
      home: const HomeScreen(),
      title: "News App",
    );
  }
}
