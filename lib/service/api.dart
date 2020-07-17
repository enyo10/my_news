import 'dart:convert';
import 'package:mynews/models/time_ware.dart';
import 'package:http/http.dart' as http;
import 'package:mynews/models/most_pop_article.dart';
import 'package:mynews/models/top_news_data.dart';
import 'package:mynews/utils/article_resource.dart';

class Api {
  static ArticleResource<List<TopNews>> fetchTopNews() {
    return ArticleResource(
      url:
          'https://api.nytimes.com/svc/topstories/v2/world.json?api-key=a3MIUuNZySQaVNgYhjN4YY7xGRhnBG0A',
      parse: (response) {
        final result = json.decode(response.body);
        Iterable list = result['results'];
        return list.map((model) => TopNews.fromJson(model)).toList();
      },
    );
  }

  static ArticleResource<List<MostPopArticle>> fetchMostPopArticle() {
    return ArticleResource(
      url:
          'https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=a3MIUuNZySQaVNgYhjN4YY7xGRhnBG0A',
      parse: (response) {
        final result = json.decode(response.body);
        Iterable list = result['results'];

        return list.map((model) => MostPopArticle.fromJson(model)).toList();
      },
    );
  }

  static ArticleResource<List<Article>> fetchTimeWireArticle() {
    return ArticleResource(
      url:
          'https://api.nytimes.com/svc/news/v3/content/all/all.json?api-key=a3MIUuNZySQaVNgYhjN4YY7xGRhnBG0A',
      parse: (response) {
        final result = json.decode(response.body);
        Iterable list = result['results'];

        return list.map((model) => Article.fromJson(model)).toList();
      },
    );
  }
}

Future<T> loadData<T>(ArticleResource<T> articleResource) async {
  final response = await http.get(articleResource.url);
  if (response.statusCode == 200) {
    return articleResource.parse(response);
  } else {
    throw Exception('Failed to load data!');
  }
}

Future<List<Article>> fetchTimeWireData() async {
  final response = await http.get(
      'https://api.nytimes.com/svc/news/v3/content/all/all.json?api-key=a3MIUuNZySQaVNgYhjN4YY7xGRhnBG0A');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final result = json.decode(response.body);
    Iterable list = result['results'];
    return list.map((model) => Article.fromJson(model)).toList();

    //  return Article.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Article>> fetchMostPopular() async {
  final response = await http.get(
      'https://api.nytimes.com/svc/news/v3/content/all/all.json?api-key=a3MIUuNZySQaVNgYhjN4YY7xGRhnBG0A');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final result = json.decode(response.body);
    Iterable list = result['results'];
    return list.map((model) => Article.fromJson(model)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Article>> fetchTopNews() async {
  final response = await http.get(
      'https://api.nytimes.com/svc/news/v3/content/all/all.json?api-key=a3MIUuNZySQaVNgYhjN4YY7xGRhnBG0A');
  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    Iterable list = result['results'];
    return list.map((model) => Article.fromJson(model)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}
