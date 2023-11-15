import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_model.dart';
import 'package:news_app/ui/screens/news_search_page.dart';
import 'package:news_app/ui/tabs/categories_tab/categories_tab.dart';
import 'package:news_app/ui/tabs/settings_tab/settings_tab.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_theme.dart';
import '../../tabs/news_tab/news_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentTab;
  @override
  void initState() {
    super.initState();
    currentTab = CategoriesTab(onCategoryClick);
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        setState(() {});
        if(currentTab is! CategoriesTab){
          currentTab = CategoriesTab(onCategoryClick);
          return false;
        }else{
          return true;
        }

      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: NewsSearchPage());
            }, icon: Icon(Icons.search))
          ],
        ),
        body: currentTab,
        drawer: buildDrawer(),
      ),
    );
  }
  onCategoryClick(CategoryModel categoryModel){
    currentTab = NewsTab(categoryModel.id);
    setState(() {});
  }

  buildDrawer() {
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
          buildDrawerRow(Icons.category, "Categories", (){
            currentTab = CategoriesTab(onCategoryClick);
            Navigator.pop(context);
            setState(() {});
          }),
          buildDrawerRow(Icons.settings, "Settings", (){
            currentTab = const SettingsTab();
            Navigator.pop(context);
            setState(() {});
          }),
        ],
      ),
    );
  }

  buildDrawerRow(IconData iconData, String title, Function onClick) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: () {
        onClick();
      },
      child: Row(
        children: [
          Icon(iconData, size: 28,),
          const SizedBox(width: 12,),
          Text(title, style: AppTheme.appTheme.textTheme.headlineLarge!.copyWith(color: Colors.black),),
        ],
      ),
    ),
  );
}
