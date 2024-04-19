import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repos/news_repo/data_sources/source_tabs_offline_datasource.dart';
import 'package:news_app/data/repos/news_repo/source_tabs_repo.dart';

import '../../data/model/sources_response.dart';
import '../../data/repos/news_repo/data_sources/source_tabs_online_datasource.dart';

class SourcesViewModel extends Cubit <SourcesTabsStates>{
  NewsRepo newsRepo = NewsRepo(OfflineDataSource(), OnlineDataSource());

  SourcesViewModel() : super(SourcesTabsLoading());

  void getSources(String category) async {
    emit(SourcesTabsLoading());
    try {
      SourcesResponse? sourcesResponse = await newsRepo.getSources(category);

      if (sourcesResponse != null &&
          sourcesResponse.sources?.isNotEmpty == true) {

        emit(SourcesTabsSuccess(sourcesResponse.sources!));

      } else {
        throw "Something Went Wrong";
      }
    } catch (e) {
      emit(SourcesTabsError(e.toString()));
    }
  }
}

abstract class SourcesTabsStates{}

class SourcesTabsLoading extends SourcesTabsStates{}

class SourcesTabsSuccess extends SourcesTabsStates{
  List<Source> sources;

  SourcesTabsSuccess(this.sources);
}

class SourcesTabsError extends SourcesTabsStates{
  String errorMessage;

  SourcesTabsError(this.errorMessage);
}
