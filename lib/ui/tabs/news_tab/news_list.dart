import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/ui/components/error_view.dart';
import 'package:news_app/ui/components/loading.dart';

class NewsList extends StatelessWidget {
  final String sourceId;

  const NewsList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(sourceId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildArticlesListView(snapshot.data!);
          } else if (snapshot.hasError) {
            return ErrorView(
                message: snapshot.error.toString());
          }else{
            return const Loading();
          }
        });
  }

  Widget buildArticlesListView(List<Article> list) {
    return Container();
  }
}
