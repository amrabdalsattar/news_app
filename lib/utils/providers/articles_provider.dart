import 'package:flutter/material.dart';
import 'package:news_app/data/repos/articles_repo/articles_repo.dart';
import 'package:news_app/data/repos/articles_repo/data_sources/articles_offline_datasource.dart';
import 'package:news_app/data/repos/articles_repo/data_sources/articles_online_datasource.dart';

import '../../data/model/articles_response.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<Article> articles = [];
  bool isLoading = false;
  String errorMessage = "";
  ArticleRepo articleRepo =
      ArticleRepo(ArticlesOnlineDataSource(), ArticlesOfflineDataSource());

  void getArticles(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      ArticlesResponse? articlesResponse =
          await articleRepo.getArticles(sourceId);
      if (articlesResponse != null &&
          articlesResponse.articles?.isNotEmpty == true) {
        articles = articlesResponse.articles!;
      } else {
        throw "Something Went Wrong";
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
