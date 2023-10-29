import 'package:flutter/material.dart';
import 'package:news_app/utils/app_theme.dart';

class MyDrawerButton extends StatelessWidget {
  final String routeName;
  final String tabTitle;
  final IconData icon;

  const MyDrawerButton(
      {super.key,
      required this.routeName,
      required this.icon,
      required this.tabTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, routeName);
        },
        child: Row(
          children: [
            Icon(icon, size: 28,),
            const SizedBox(width: 12,),
            Text(tabTitle, style: AppTheme.appTheme.textTheme.headlineLarge!.copyWith(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
