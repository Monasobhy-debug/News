import 'package:http/http.dart' as http;
import 'package:news/model/article_model.dart';
import 'dart:convert';
import 'package:news/model/articles_model.dart';

//https://newsapi.org/v2/top-headlines?country=us&apiKey=72cbef0ddad04689bba0393065b5c36c
class NewsApi {
  final String apikey = '72cbef0ddad04689bba0393065b5c36c';
  final String openNewsUrl = 'https://newsapi.org/v2/top-headlines';
  Future<List<Article>> fetchArticles() async {
    try {
      http.Response response =
          await http.get(Uri.parse('$openNewsUrl?country=us&apiKey=$apikey'));

      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articlesList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      } else
        print('Status code ${response.statusCode}');
    } catch (ex) {
      print(ex);
    }
  }
}
