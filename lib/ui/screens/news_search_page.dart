import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/ui/tabs/news_tab/widget/article_widget.dart';
import 'package:news_app/utils/app_colors.dart';

import '../components/error_view.dart';
import '../components/loading.dart';

class NewsSearchPage extends SearchDelegate{

  TextStyle? get searchFieldStyle => TextStyle(
    color: AppColor.white
  );

  @override
  ThemeData appBarTheme(BuildContext context){
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: AppColor.white),
        border: InputBorder.none,
        labelStyle: TextStyle()
      ),
      appBarTheme: AppBarTheme(
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: AppColor.primary
      )
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: (){
      showResults(context);
    }, icon: Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.close));

  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder(future: ApiManager.search(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var articles = snapshot.data;
            return ListView.builder(
                itemCount: articles?.length,
                itemBuilder: (context, index)=>
                    ArticleWidget(article: articles![index])
            );
          } else if (snapshot.hasError) {
            return ErrorView(message: snapshot.error.toString());
          } else {
            return const Loading();
          }

        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return FutureBuilder(future: ApiManager.search(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var articles = snapshot.data;
            return ListView.builder(
                itemCount: articles?.length,
                itemBuilder: (context, index)=>
                ArticleWidget(article: articles![index])
            );
          } else if (snapshot.hasError) {
            return ErrorView(message: snapshot.error.toString());
          } else {
            return const Loading();
          }

        }
        );
  }
  
}