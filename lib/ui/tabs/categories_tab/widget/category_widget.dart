import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_model.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_theme.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  final Radius radius = const Radius.circular(16);

  const CategoryWidget({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryModel.backGroundColor,
          borderRadius: BorderRadius.only(
            topRight: radius,
            topLeft: radius,
            bottomLeft: categoryModel.isLeftSided ? Radius.zero : radius,
            bottomRight: categoryModel.isLeftSided ? radius : Radius.zero,
          )),

      child: Center(
        child: Column(
          children: [
            Spacer(),
            Image.asset(categoryModel.imagePath, height: MediaQuery.of(context).size.height * 0.14,),
            Expanded(
              child: Text(
                categoryModel.title,
                style: AppTheme.medium.copyWith(color: AppColor.white, fontSize: 20),
              ),

            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
