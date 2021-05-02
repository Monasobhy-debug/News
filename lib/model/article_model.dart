class Article {
  final String title;
  final String imageUrl;
  final String description;
  final String articleUrl;

  Article({this.title, this.imageUrl, this.description, this.articleUrl});
  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
      title: jsonData['title'],
      imageUrl: jsonData['urlToImage'],
      description: jsonData['description'],
      articleUrl: jsonData['url'],
    );
  }
}
