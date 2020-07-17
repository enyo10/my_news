import 'package:http/http.dart';

class ArticleResource<T> {
  final String url;
  T Function(Response response) parse;

  ArticleResource({this.url, this.parse});
}
