import 'package:flutter/material.dart';
import 'package:news_app/utils/app_asset.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryModel {
  String id;
  Color backGroundColor;
  String imagePath;
  String title;
  bool isLeftSided;

  CategoryModel({required this.id,
    required this.backGroundColor,
    required this.title,
    required this.isLeftSided,
    required this.imagePath});

  static List<CategoryModel> categories = [
    CategoryModel(id: "sports",
        backGroundColor: AppColor.sportsBackGround,
        title: "Sports",
        isLeftSided: true,
        imagePath: AppAsset.ball),
    CategoryModel(id: "technology",
        backGroundColor: AppColor.politicsBackGround,
        title: "Technology",
        isLeftSided: false,
        imagePath: AppAsset.politics),
    CategoryModel(id: "health",
        backGroundColor: AppColor.healthBackGround,
        title: "Health",
        isLeftSided: true,
        imagePath: AppAsset.health),
    CategoryModel(id: "business",
        backGroundColor: AppColor.businessBackGround,
        title: "Business",
        isLeftSided: false,
        imagePath: AppAsset.business),
    CategoryModel(id: "entertainment",
        backGroundColor: AppColor.environmentBackGround,
        title: "Entertainment",
        isLeftSided: true,
        imagePath: AppAsset.environment),
    CategoryModel(id: "science",
        backGroundColor: AppColor.scienceBackGround,
        title: "Science",
        isLeftSided: false,
        imagePath: AppAsset.science),
  ];
}
