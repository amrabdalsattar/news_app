import 'package:flutter/cupertino.dart';
import 'package:news_app/data/repos/news_repo/data_sources/source_tabs_offline_datasource.dart';
import 'package:news_app/data/repos/news_repo/source_tabs_repo.dart';

import '../../data/model/sources_response.dart';
import '../../data/repos/news_repo/data_sources/source_tabs_online_datasource.dart';

class SourcesViewModel extends ChangeNotifier {
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;
  NewsRepo newsRepo = NewsRepo(OfflineDataSource(), OnlineDataSource());

  void getSources(String category) async {
    isLoading = true;
    notifyListeners();
    try {
      SourcesResponse? sourcesResponse = await newsRepo.getSources(category);
      if(sourcesResponse != null && sourcesResponse.sources?.isNotEmpty == true){
        sources = sourcesResponse.sources!;
      }else{
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
