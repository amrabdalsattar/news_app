import 'dart:convert';

import 'package:http/http.dart';

import '../../../model/articles_response.dart';

class ArticlesOnlineDataSource {
  static const String apiKey = "b27f46a1e4ac4bf09ef21f6fc7e5f83d";
  static const String baseUrl = "newsapi.org";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndpoint = "/v2/everything";

  Future<ArticlesResponse> getArticles(String sourceId) async {
    Uri url = Uri.https(
        baseUrl, articlesEndpoint, {"apiKey": apiKey, "sources": sourceId});
    var serverResponse = await get(url);
    Map json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    if (serverResponse.statusCode >= 200 &&
        serverResponse.statusCode < 300 &&
        articlesResponse.articles?.isNotEmpty == true) {
      return articlesResponse;
    }
    throw Exception("Something Went Wrong, Please Try Again");
  }
}
