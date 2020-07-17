import 'package:flutter/material.dart';
import 'package:mynews/models/top_news_data.dart';
import 'package:mynews/service/api.dart';
import 'package:mynews/service/web_service.dart';

import 'item_widget.dart';

class TopNewPage extends StatefulWidget {
  @override
  _TopNewPageState createState() => _TopNewPageState();
}

class _TopNewPageState extends State<TopNewPage> {
  // Future<List<TopNews>> timeWireData;
  List<TopNews> articles = [];

  @override
  void initState() {
    super.initState();
    updateArticleList();
  }

  void updateArticleList() {
    Future<List<TopNews>> future = Webservice().load(Api.fetchTopNews());
    future.then(
      (values) => {
        setState(() => {articles = values})
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if ((articles.length == 0)) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 5,
        ),
      );
    } else {
      return ListView.separated(
        itemCount: articles.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final article = articles[index];

          return ListItem(
            url: article.url,
            title: article.title,
            section: article.section,
            date: article.publishedDate.substring(0, 10),
            thumbnail: article.multimedia == null
                ? Image.asset('assets/placeholder.png')
                : Image.network(
                    article.multimedia[3]['url'],
                    height: 140.0,
                    fit: BoxFit.fitHeight,
                  ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      );
    }
  }
}
