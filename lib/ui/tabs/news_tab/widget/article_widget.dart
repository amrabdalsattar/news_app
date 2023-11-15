import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/ui/components/loading.dart';
import 'package:news_app/ui/screens/details_screen/details_screen.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_theme.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, DetailsScreen.routeName, arguments: article);
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              stops: [0.0, (100 - 56) / 100],
              colors: [AppColor.transparent, AppColor.white],
            ),
            borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: CachedNetworkImage(
                  imageUrl: article.urlToImage!,
                  placeholder: (_, __) => const Loading(),
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                  height:
                      MediaQuery.of(context).size.height * 0.2609427609427609),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(article.source?.name ?? "",
                      style: AppTheme.appTheme.textTheme.bodySmall),
                  const SizedBox(height: 4,),
                  Text(article.title ?? "",
                      style: AppTheme.appTheme.textTheme.bodyLarge),
                  const SizedBox(height: 4,),
                  Text(article.publishedAt ?? "",
                      textAlign: TextAlign.end,
                      style: AppTheme.appTheme.textTheme.bodyMedium!.copyWith(color: AppColor.semiGrey)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
