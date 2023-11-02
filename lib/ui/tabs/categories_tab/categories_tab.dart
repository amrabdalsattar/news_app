import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_model.dart';
import 'package:news_app/ui/tabs/categories_tab/widget/category_widget.dart';
import 'package:news_app/utils/app_theme.dart';

import '../../../utils/app_asset.dart';

class CategoriesTab extends StatelessWidget {
  final Function onCategoryClick;

  const CategoriesTab(this.onCategoryClick, {super.key});

  @override
  Widget build(BuildContext context) {
    SizedBox sizedBox = SizedBox(
      height: MediaQuery.of(context).size.height * 0.0314253647586981,
    );
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAsset.backGround), fit: BoxFit.cover)),
      child: Container(
        margin: const EdgeInsets.only(top: 36, right: 36, left: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Pick your category of interest",
              style: AppTheme.appTheme.textTheme.headlineLarge,
            ),
            sizedBox,
            Expanded(
              child: GridView.builder(
                itemCount: CategoryModel.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onCategoryClick(CategoryModel.categories[index]);
                  },
                  child: CategoryWidget(
                      categoryModel: CategoryModel.categories[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
