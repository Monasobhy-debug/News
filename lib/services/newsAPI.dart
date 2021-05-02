import 'package:http/http.dart' as http;
import 'package:news/model/article_model.dart';
import 'dart:convert';
import 'package:news/model/articles_model.dart';

//https://newsapi.org/v2/top-headlines?country=us&apiKey=20c0791cb79549a1bb1815154ae4f14e

class NewsApi {
  final String apikey = '20c0791cb79549a1bb1815154ae4f14e';
  final String openNewsUrl = 'https://newsapi.org/v2/top-headlines';
  var data;
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
      } else {
        print('Status code ${response.statusCode}');
        return data;
      }
    } catch (ex) {
      print(ex);
    }
  }
}
