class Article {
  final String title;
  final String imageUrl;
  final String description;

  Article({this.title, this.imageUrl, this.description});
  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
      title: jsonData['title'],
      imageUrl: jsonData['urlToImage'],
      description: jsonData['description'],
    );
  }
}
