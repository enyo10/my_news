import 'package:flutter/material.dart';
import 'package:mynews/widgets/article_details.dart';
import 'package:mynews/widgets/stepper_listview.dart';

class ListItem extends StatelessWidget {
  ListItem({this.title, this.date, this.section, this.url, this.thumbnail});

  final String title;
  final String date;
  final String section;
  final Widget thumbnail;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WebViewClass(
            initialUrl: url,
          ),
        ),
      ),
      child: Card(
        elevation: 5,
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.all(4.0),
          height: 140.0,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: thumbnail,
                ),
                flex: 2,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            section,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                flex: 3,
              ),
              /*Flexible(
                flex: 2,
                child: Container(
                  color: Colors.green,
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
