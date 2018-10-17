import 'package:flutter/material.dart';
import 'package:youtube_ui/account.dart';
import 'package:youtube_ui/feed.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Clone',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColorBrightness: Brightness.light,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = new TabController(vsync: this, length: 4);
  }

  @override
  dispose() {
    super.dispose();
    this.tabController.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _appBar(),
      body: new TabBarView(
        controller: this.tabController,
        children: <Widget>[
          new HomeFeed(),
          new TrendingFeed(),
          new SubscriptionsFeed(),
          new Account(),
        ],
      ),
    );
  }

  //App Bar
  Widget _appBar() {
    return new AppBar(
      backgroundColor: Colors.red,
      elevation: 0.0,
      title: new Text("Home",
          style: new TextStyle(color: Colors.white, fontSize: 23.0)),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(
            Icons.search,
            color: Colors.white,
            size: 28.0,
          ),
          onPressed: () {},
        ),
        new IconButton(
          icon: new Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 28.0,
          ),
          onPressed: () {},
        ),
      ],
      bottom: new TabBar(
        controller: this.tabController,
        indicatorColor: Colors.white,
        tabs: [
          new Tab(
            icon: new Icon(Icons.home, size: 29.0, color: Colors.black54),
          ),
          new Tab(
            icon: new Icon(Icons.whatshot, size: 29.0, color: Colors.black54),
          ),
          new Tab(
            icon: new Icon(Icons.subscriptions,
                size: 28.0, color: Colors.black54),
          ),
          new Tab(
            icon: new Icon(
              Icons.person,
              size: 30.0,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
