import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/data/model/sources_response.dart';

class OnlineDataSource {
  static const String apiKey = "b27f46a1e4ac4bf09ef21f6fc7e5f83d";
  static const String baseUrl = "newsapi.org";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndpoint = "/v2/everything";

  Future<SourcesResponse> getSources(String category) async {
    Uri url = Uri.parse(
        "https://$baseUrl$sourcesEndPoint?apiKey=$apiKey&category=$category");
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        sourcesResponse.sources?.isNotEmpty == true) {
      return sourcesResponse;
    }
    throw Exception(sourcesResponse.message);
  }

  Future<List<Article>> search(String q) async {
    Uri url = Uri.https(baseUrl, articlesEndpoint, {"apiKey": apiKey, "q": q});
    var serverResponse = await get(url);
    Map json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    if (serverResponse.statusCode >= 200 &&
        serverResponse.statusCode < 300 &&
        articlesResponse.articles?.isNotEmpty == true) {
      return articlesResponse.articles!;
    }
    throw Exception("Something Went Wrong, Please Try Again");
  }
}
