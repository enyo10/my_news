import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mynews/widgets/most_pop_page.dart';
import 'package:mynews/widgets/time_ware_page.dart';
import 'package:mynews/widgets/top_news_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New your Time',
      home: DefaultTabController(
        length: _choices.length,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Center(
                    child: Text(
                      'My News',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Charmonman',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    'Home',
                  ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(
              'My News',
              style: TextStyle(
                fontFamily: 'Charmonman',
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            actions: <Widget>[Icon(Icons.search)],
            backgroundColor: Colors.black,
            bottom: TabBar(
              labelStyle: TextStyle(fontSize: 18),
              labelPadding: EdgeInsets.zero,
              tabs: _choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                );
              }).toList(),
            ),
          ),
          body: Container(
            //decoration: BoxDecoration(color: Colors.black54),

            child: TabBarView(
              children: [
                TimeWirePage(),
                MostPopPage(),
                TopNewPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title});
  final String title;
}

const List<Choice> _choices = [
  Choice(title: 'Times Wire'),
  Choice(title: 'MostPopular'),
  Choice(title: 'TopNews')
];

class ChoicePage extends StatelessWidget {
  ChoicePage({this.choice});
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
