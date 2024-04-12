import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/search_view/search_result.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsSearchPage extends SearchDelegate {
  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        color: AppColor.white,
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: AppColor.white),
          border: InputBorder.none,
        ),
        appBarTheme: AppBarTheme(
          shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: AppColor.primary,
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () => query = "",
          icon: const Icon(
            CupertinoIcons.xmark_circle_fill,
            size: 22,
          )),
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return SearchResult(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return SearchResult(query: query);
  }
}
