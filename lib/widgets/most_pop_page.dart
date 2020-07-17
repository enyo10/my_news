import 'package:flutter/material.dart';
import 'package:mynews/models/most_pop_article.dart';
import 'package:mynews/service/api.dart';
import 'package:mynews/service/web_service.dart';
import 'item_widget.dart';

class MostPopPage extends StatefulWidget {
  @override
  _MostPopPageState createState() => _MostPopPageState();
}

class _MostPopPageState extends State<MostPopPage> {
  Future<List<MostPopArticle>> timeWireData;
  List<MostPopArticle> articles = [];

  @override
  void initState() {
    super.initState();
    updateArticleList();
  }

  void updateArticleList() {
    Future<List<MostPopArticle>> future =
        Webservice().load(Api.fetchMostPopArticle());
    future.then(
      (values) => {
        if (mounted)
          {
            setState(() => {articles = values})
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //  updateArticleList();
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
            date: article.publishedDate,
            thumbnail: article.media.length == 0
                ? Image.asset('assets/placeholder.png')
                : Image.network(
                    article.media[0]['media-metadata'][1]['url'],
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
