import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/ui/screens/web_view.dart';

import '../../../utils/app_asset.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/functions.dart';
import '../../components/loading.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "details";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? ""),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAsset.backGround), fit: BoxFit.cover)),
        margin: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                  imageUrl: article.urlToImage!,
                  placeholder: (_, __) => const Loading(),
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                  height:
                      MediaQuery.of(context).size.height * 0.2609427609427609),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 4, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(article.source?.name ?? "",
                      style: AppTheme.appTheme.textTheme.bodySmall),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(article.title ?? "",
                      style: AppTheme.appTheme.textTheme.bodyLarge),
                  const SizedBox(
                    height: 4,
                  ),

                  Text(formatTimeAgo(DateTime.parse(article.publishedAt!),),
                      textAlign: TextAlign.end,
                      style: AppTheme.appTheme.textTheme.bodyMedium!
                          .copyWith(color: AppColor.semiGrey)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(article.description ?? ""),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewPage(url: article.url!,)));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "View Full Article",
                          style: TextStyle(fontSize: 14, color: AppColor.webViewRouterColor),
                        ),
                        Icon(Icons.arrow_right, size: 25, color: AppColor.webViewRouterColor,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
