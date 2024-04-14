import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/search_view/search_errors.dart';

import '../../../data/repos/news_repo/data_sources/source_tabs_online_datasource.dart';
import '../../components/error_view.dart';
import '../../components/loading.dart';
import '../../tabs/news_tab/widget/article_widget.dart';

class SearchResult extends StatelessWidget {
  final String query;
  const SearchResult({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: OnlineDataSource().search(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var articles = snapshot.data;
            return ListView.builder(
                itemCount: articles?.length,
                itemBuilder: (context, index)=>
                    ArticleWidget(article: articles![index])
            );
          } else if (snapshot.hasError) {
            if(query.isEmpty){
              return const ErrorView(message: "Let's GO",);
            }else{
              return notFoundErrorView(context);
            }
          } else {
            return const Loading();
          }

        }
    );
  }
}
