import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/data/repos/articles_repo/data_sources/articles_offline_datasource.dart';

import '../../model/articles_response.dart';
import 'data_sources/articles_online_datasource.dart';

class ArticleRepo {
  ArticlesOnlineDataSource articlesOnlineDataSource;
  ArticlesOfflineDataSource articlesOfflineDataSource;
  ArticleRepo(this.articlesOnlineDataSource, this.articlesOfflineDataSource);

  Future<ArticlesResponse?> getArticles(String sourceId) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      ArticlesResponse response =
          await articlesOnlineDataSource.getArticles(sourceId);
      articlesOfflineDataSource.saveArticle(sourceId, response);
      return response;
    } else {
      return articlesOfflineDataSource.getArticle(sourceId);
    }
  }
}
