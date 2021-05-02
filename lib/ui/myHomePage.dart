import 'package:flutter/material.dart';
import 'newsItem.dart';
import 'package:news/services/newsAPI.dart';

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
    } catch (ex) {
      // print(ex);
    }
    return articles;
  }

  @override
  void initState() {
    super.initState();
    //  getData();
  }

  @override
  Widget build(BuildContext context) {
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
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
