import 'package:flutter/material.dart';

//This will serve as a package for all the feeds we will be building
//The feeds will take in list of Cards into themselves and show those cards as feeds.
//These card's data will come from either a dummy data or even from a youtube api.

//-------------Home feed
class HomeFeed extends StatefulWidget {
  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new YoutubeCard(),
    );
  }
}

//-------------Trending feed
class TrendingFeed extends StatefulWidget {
  @override
  _TrendingFeedState createState() => _TrendingFeedState();
}

class _TrendingFeedState extends State<TrendingFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text("This is home from trending"),
    );
  }
}

//--------------Subs feed
class SubscriptionsFeed extends StatefulWidget {
  @override
  _SubscriptionsFeedState createState() => _SubscriptionsFeedState();
}

class _SubscriptionsFeedState extends State<SubscriptionsFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text("This is home from subscription"),
    );
  }
}

//----------------Cards
class YoutubeCard extends StatefulWidget {
  @override
  _YoutubeCardState createState() => _YoutubeCardState();
}

class _YoutubeCardState extends State<YoutubeCard> {
  @override
  Widget build(BuildContext context) {
    const pad = 15.0;
    return new Card(
      elevation: 0.0,
      margin: const EdgeInsets.all(pad),
      child: new Column(
        children: <Widget>[
          Image.network(
            "https://i.ytimg.com/vi/5NqitWbBim8/maxresdefault.jpg",
            fit: BoxFit.cover,
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(top: pad),
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(
                          "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d34b70c76d7e81532a3f922ba31f3a5f&w=1000&q=80"),
                      radius: 24.0,
                    ),
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                          padding:
                              EdgeInsets.only(left: pad, right: pad, top: pad),
                          child: new Text(
                            "How to Apologize (A Guide for People Who Suck At It)",
                            style: new TextStyle(
                                color: Colors.black, fontSize: 17.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Icon(
                    Icons.more_vert,
                    color: Colors.grey[700],
                    size: 25.0,
                  )
                ],
              ),
              new Padding(
                padding: EdgeInsets.only(left: 48.0 + pad),
                child: new Text(
                  "llSuperwomanll . 1M views . 1 month ago",
                  style: new TextStyle(color: Colors.grey[700], fontSize: 16.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
