import 'package:flutter/material.dart';
import 'newsItem.dart';
import 'package:news/services/newsAPI.dart';
import 'package:news/model/article_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var articles;
  getData() async {
    try {
      NewsApi newsApi = NewsApi();
      articles = await newsApi.fetchArticles();
      // for (var article in articles) {
      //   print(article.description);
      // }
      return articles;
    } catch (ex) {}
  }

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    // print(articles[0].title);
    // print(articles[1].imageUrl);
    // print(articles[1].description);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('News'),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            // print(index);
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NewsItem(
                    title: articles[index].title,
                    imageUrl: articles[index].imageUrl,
                    description: articles[index].description,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
