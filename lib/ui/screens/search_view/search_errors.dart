import 'package:flutter/material.dart';
import 'package:news_app/utils/app_asset.dart';
import 'package:news_app/utils/app_colors.dart';

Widget notFoundErrorView(BuildContext context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAsset.searchNotFound,
              height: MediaQuery.of(context).size.height * 0.35),
          const Text("No Results",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          const Text("Check your spelling or try a new Search",
              style: TextStyle(color: AppColor.grey)),
        ],
      ),
    );
