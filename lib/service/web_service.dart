import 'package:http/http.dart' as http;
import 'package:mynews/utils/article_resource.dart';

class Webservice {
  Future<T> load<T>(ArticleResource<T> resource) async {
    final response = await http.get(resource.url);
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
