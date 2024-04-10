import "dart:async";
import "dart:convert";

import "package:http/http.dart" as http;
import "package:news_app/src/models/news.dart";

class NewsResponse {
  final int statusCode;
  final List<News> newsList;

  NewsResponse({required this.statusCode, required this.newsList});
}

Future<NewsResponse> getAllTopStories(String string) async {
  List<News> finalAllNews = [];
  try {
    final response = await http
        .get(Uri.parse("https://hacker-news.firebaseio.com/v0/$string.json"));
    if (response.statusCode == 200) {
      final allTsIDs = jsonDecode(response.body);
      for (int i = 0; i < 10; i++) {
        final res = await http.get(Uri.parse(
            "https://hacker-news.firebaseio.com/v0/item/${allTsIDs[i]}.json"));
        // print(res.body);
        final body = jsonDecode(res.body);
        if (body["id"] == 39971645){
          continue;
        }
        News temp = News(
          by: body["by"],
          id: body['id'],
          title: body['title'],
          type: body['type'],
          url: body['url'],
        );
        finalAllNews.add(temp);
      }
      return NewsResponse(
          statusCode: response.statusCode, newsList: finalAllNews);
    }
  } catch (e) {
    // throw e;
  }
  return NewsResponse(statusCode: 404, newsList: []);
}
