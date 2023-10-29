import 'package:flutter/material.dart';
import 'package:news_app/ui/components/drawer/buttons.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/utils/app_asset.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1727678571428571,
            color: AppColor.primary,
            child: SafeArea(
              child: Center(
                child: Text(
                  "News App!",
                  style: AppTheme.appTheme.textTheme.headlineLarge!
                      .copyWith(color: AppColor.white),
                ),
              ),
            ),
          ),
          const MyDrawerButton(
              routeName: HomeScreen.routeName,
              icon: Icons.category,
              tabTitle: "Categories"),
          const MyDrawerButton(
              routeName: HomeScreen.routeName,
              icon: Icons.settings,
              tabTitle: "Settings"),
        ],
      ),
    );
  }
}
