import 'package:flutter/material.dart';
import 'package:news_app/ui/components/drawer/drawer.dart';
import 'package:news_app/ui/screens/home/tabs/news_tab/news_tab.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      body: NewsTab(),
      drawer: const MyDrawer(),
    );
  }
}
