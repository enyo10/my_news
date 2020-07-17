import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class Article {
  dynamic data;
  Article.fromJson(this.data);
}

Future<List<Article>> fetchArticle(http.Client client) async {
  final response = await client.get(
      'https://api.nytimes.com/svc/news/v3/content/all/all.json?api-key=a3MIUuNZySQaVNgYhjN4YY7xGRhnBG0A');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    final result = json.decode(response.body);
    Iterable list = result['results'];
    return list.map((model) => Article.fromJson(model)).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

main() {
  // Tests go here
  group('fetchArticle', () {
    test('returns a Post if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(
              'https://api.nytimes.com/svc/news/v3/content/all/all.json?api-key=a3MIUuNZySQaVNgYhjN4YY7xGRhnBG0A'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await fetchArticle(client), isA<List<Article>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchArticle(client), throwsException);
    });
  });
}
