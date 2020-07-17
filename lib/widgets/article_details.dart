import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mynews/models/article_data.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetails extends StatelessWidget {
  final ArticleData articleData;

  const ArticleDetails({this.articleData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 1000),
              child: WebView(
                initialUrl:
                    "https://flutter.dev/docs/cookbook/networking/web-sockets",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebViewClass extends StatefulWidget {
  final String initialUrl;

  WebViewClass({this.initialUrl});

  WebViewState createState() => WebViewState();
}

class WebViewState extends State<WebViewClass> {
  num position = 1;

  final key = UniqueKey();

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('${widget.initialUrl}');
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Article details'),
          backgroundColor: Colors.black,
        ),
        body: IndexedStack(index: position, children: <Widget>[
          WebView(
            initialUrl: widget.initialUrl,
            javascriptMode: JavascriptMode.unrestricted,
            key: key,
            onPageStarted: startLoading,
            onPageFinished: doneLoading,
          ),
          Container(
            color: Colors.white,
            child: Center(child: CircularProgressIndicator()),
          ),
        ]));
  }
}
