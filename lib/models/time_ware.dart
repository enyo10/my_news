class Article {
  Article(
      {this.title,
      this.url,
      this.description,
      this.pubDate,
      this.createdDate,
      this.section,
      this.subsection,
      this.image,
      this.multimedia});

  final String title;
  final String url;
  final String description;
  final String pubDate;
  final String createdDate;
  final String section;
  final String subsection;
  final String image;
  final List<dynamic> multimedia;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        title: json['title'],
        url: json['url'],
        description: json['description'],
        pubDate: json['published_date'],
        createdDate: json['createdDate'],
        section: json['section'],
        subsection: json['subsection'],
        image: json['thumbnail_standard'],
        multimedia: json['multimedia']);
  }
}
