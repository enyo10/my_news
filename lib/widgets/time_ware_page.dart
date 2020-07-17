import 'package:flutter/material.dart';
import 'package:mynews/models/time_ware.dart';
import 'package:mynews/service/api.dart';
import 'package:mynews/service/web_service.dart';

import 'item_widget.dart';

class TimeWirePage extends StatefulWidget {
  @override
  _TimeWirePageState createState() => _TimeWirePageState();
}

class _TimeWirePageState extends State<TimeWirePage> {
  Future<List<Article>> timeWireData;
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    updateArticleList();
  }

  void updateArticleList() {
    Future<List<Article>> future =
        Webservice().load(Api.fetchTimeWireArticle());
    future.then(
      (values) => {
        setState(() => {articles = values})
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
        itemBuilder: (BuildContext context, int index) {
          final article = articles[index];

          return ListItem(
            url: article.url,
            title: article.title,
            section: article.section,
            date: article.pubDate.substring(0, 10),
            thumbnail: article.multimedia == null
                ? Image.asset('assets/placeholder.png')
                : Image.network(
                    //article.image,
                    article.multimedia[1]['url'],
                    height: 140.0,
                    fit: BoxFit.fitHeight,
                  ),
          );
          /*ListTile(
          leading: SizedBox(
            width: 100.0,
            height: 100.0,
            child: FadeInImage.assetNetwork(
              width: 100.0,
              height: 100.0,
              placeholder: 'assets/placeholder.png',
              image: articles[index].image == null ? '' : articles[index].image,
              fit: BoxFit.fitHeight,
            ),
          ),
          title: Text(
            articles[index].title,
          ),
        );*/
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      );
    }
  }
}
