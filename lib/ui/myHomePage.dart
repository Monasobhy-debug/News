// import 'dart:async';
import 'package:flutter/material.dart';
import 'newsItem.dart';
import 'package:news/services/newsAPI.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List articles = [];
  void getData() async {
    NewsApi newsApi = NewsApi();
    // while (articles.isEmpty)
    articles = await newsApi.fetchArticles();

    // setState(() {
    //   print(articles);
    // });
    // for (var article in articles) {
    //   print(article.description);
    // }
    // return articles;
  }

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    // print(articles[1].title);
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
      body: (articles.isNotEmpty)
          ? ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                print(index);
                return SafeArea(
                  child: SingleChildScrollView(
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
                  ),
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
