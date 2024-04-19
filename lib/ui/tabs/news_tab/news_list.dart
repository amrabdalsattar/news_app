import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/ui/components/error_view.dart';
import 'package:news_app/ui/components/loading.dart';
import 'package:news_app/ui/tabs/news_tab/widget/article_widget.dart';

import '../../../utils/view_models/articles_provider.dart';

class NewsList extends StatefulWidget {
  final String sourceId;

  const NewsList({super.key, required this.sourceId});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  ArticlesViewModel viewModel = ArticlesViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getArticles(widget.sourceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesViewModel, ArticlesStates>(
      bloc: viewModel,
      builder: (_, state) {
        Widget articleContent;
        if (state is ArticleLoading) {
          articleContent = const Loading();
        } else if (state is ArticleSuccess) {
          articleContent = buildArticlesListView(state.articles);
        } else {
          state as ArticleError;
          articleContent = ErrorView(message: state.errorMessage);
        }
        return articleContent;
      },
    );
  }

  Widget buildArticlesListView(List<Article> articles) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: articles.length,
        itemBuilder: (context, index) =>
            ArticleWidget(article: articles[index]));
  }
}
