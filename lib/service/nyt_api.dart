import 'package:mynews/models/most_pop_article.dart';
import 'package:mynews/models/time_ware.dart';
import 'package:mynews/models/top_news_data.dart';
import 'package:mynews/utils/article_resource.dart';

abstract class NytApi {
  ArticleResource<List<TopNews>> fetchTopNews();
  ArticleResource<List<MostPopArticle>> fetchMostPopArticle();
  ArticleResource<List<Article>> fetchTimeWireArticle();
}
