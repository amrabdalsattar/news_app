import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/ui/tabs/news_tab/widget/article_widget.dart';
import 'package:news_app/ui/components/error_view.dart';
import 'package:news_app/ui/components/loading.dart';
import 'package:news_app/utils/providers/articles_provider.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<ArticlesViewModel>(
        builder:
            (_,viewModel,__) {
          Widget articleContent;
          if(viewModel.isLoading){
            articleContent = const Loading();
          }else if(viewModel.articles.isNotEmpty){
            articleContent = buildArticlesListView(viewModel.articles);
          }else{
            articleContent = ErrorView(message: viewModel.errorMessage);
          }
          return articleContent;
            },
      ),
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