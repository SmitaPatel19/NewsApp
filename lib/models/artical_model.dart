class NewsArticle {
  final String headline;
  final String image;
  final String description;
  final String sourceName;
  final String publishedDate;
  final String url;

  NewsArticle({
    required this.headline,
    required this.image,
    required this.description,
    required this.sourceName,
    required this.publishedDate,
    required this.url,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      headline: json['title'] ?? '',
      image: json['urlToImage'] ?? '',
      description: json['description'] ?? '',
      sourceName: json['source']['name'] ?? '',
      publishedDate: json['publishedAt'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
