import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repos/articles_repo/articles_repo.dart';
import 'package:news_app/data/repos/articles_repo/data_sources/articles_offline_datasource.dart';
import 'package:news_app/data/repos/articles_repo/data_sources/articles_online_datasource.dart';

import '../../data/model/articles_response.dart';

class ArticlesViewModel extends Cubit<ArticlesStates> {

  ArticleRepo articleRepo =
      ArticleRepo(ArticlesOnlineDataSource(), ArticlesOfflineDataSource());

  ArticlesViewModel() : super(ArticleLoading());

  void getArticles(String sourceId) async {
    emit(ArticleLoading());
    try {
      ArticlesResponse? articlesResponse =
          await articleRepo.getArticles(sourceId);
      if (articlesResponse != null &&
          articlesResponse.articles?.isNotEmpty == true) {
        emit(ArticleSuccess(articlesResponse.articles!));
      } else {
        throw "Something Went Wrong";
      }
    } catch (e) {
      emit(ArticleError(e.toString()));
    }
  }
}

abstract class ArticlesStates{}

class ArticleLoading extends ArticlesStates{}

class ArticleSuccess extends ArticlesStates{
  List<Article> articles;
  ArticleSuccess(this.articles);
}

class ArticleError extends ArticlesStates{
  String errorMessage;
  ArticleError(this.errorMessage);
}
