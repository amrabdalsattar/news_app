import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/data/model/sources_response.dart';
import 'package:news_app/data/repos/news_repo/data_sources/source_tabs_offline_datasource.dart';
import 'package:news_app/data/repos/news_repo/data_sources/source_tabs_online_datasource.dart';

class NewsRepo {
  OnlineDataSource onlineDataSource;
  OfflineDataSource offlineDataSource;

  NewsRepo(this.offlineDataSource, this.onlineDataSource);

  Future<SourcesResponse?> getSources(String categoryId) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      SourcesResponse response = await onlineDataSource.getSources(categoryId);

      offlineDataSource.saveSources(response, categoryId);

      return response;
    } else {
      return await offlineDataSource.getSources(categoryId);
    }
  }
}
