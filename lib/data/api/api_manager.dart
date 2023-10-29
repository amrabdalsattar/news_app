import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/data/model/SourcesResponse.dart';

abstract class ApiManager {
  static const String apiKey = "b27f46a1e4ac4bf09ef21f6fc7e5f83d";
  static const String baseUrl = "newsapi.org";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";

  static Future<List<Source>> getSources() async {
    Uri url = Uri.parse("https://$baseUrl$sourcesEndPoint?apiKey=$apiKey");
    Response response = await get(url);
    print(response.body);
    Map json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    print(sourcesResponse.sources);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        sourcesResponse.sources?.isNotEmpty == true) {
      return sourcesResponse.sources!;
    }
    throw Exception(sourcesResponse.message);
  }

  getArticles() {}
}
