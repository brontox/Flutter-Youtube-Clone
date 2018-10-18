import 'dart:math';

import 'package:flutter/material.dart';
import 'package:youtube_ui/database.dart';
import 'package:youtube_ui/model.dart';

//This will serve as a package for all the feeds we will be building
//The feeds will take in list of Cards into themselves and show those cards as feeds.
//These card's data will come from either a dummy data or even from a youtube api.

//-------------Home feed--------------------------------------
class HomeFeed extends StatefulWidget {
  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: videosHome == null
          ? new CircularProgressIndicator()
          : new ListView.builder(
              itemCount: videosHome.length,
              itemBuilder: (context, index) {
                return new Column(children: [
                  new YoutubeCard(
                    video: videosHome[index],
                  ),
                  new Divider(
                    height: 0.0,
                    color: Colors.grey,
                  ),
                ]);
              }),
    );
  }
}

//-------------Trending feed---------------------------------------------
class TrendingFeed extends StatefulWidget {
  @override
  _TrendingFeedState createState() => _TrendingFeedState();
}

class _TrendingFeedState extends State<TrendingFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: videosTrending == null
          ? new CircularProgressIndicator()
          : new ListView.builder(
              itemCount: videosTrending.length,
              itemBuilder: (context, index) {
                return new Column(children: [
                  new YoutubeCard(
                    video: videosTrending[index],
                  ),
                  new Divider(
                    height: 0.0,
                    color: Colors.grey,
                  ),
                ]);
              }),
    );
  }
}

//--------------Subs feed--------------------------------------------------
class SubscriptionsFeed extends StatefulWidget {
  @override
  _SubscriptionsFeedState createState() => _SubscriptionsFeedState();
}

class _SubscriptionsFeedState extends State<SubscriptionsFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: videosHome == null
          ? new CircularProgressIndicator()
          : new ListView.builder(
              itemCount: videosHome.length,
              itemBuilder: (context, index) {
                return new Column(children: [
                  new YoutubeCard(
                    video: videosHome[index],
                  ),
                  new Divider(
                    height: 0.0,
                    color: Colors.grey,
                  ),
                ]);
              }),
    );
  }
}

//----------------Cards------------------------------
class YoutubeCard extends StatefulWidget {
  final YoutubeVideo video;

  YoutubeCard({this.video});

  @override
  _YoutubeCardState createState() => _YoutubeCardState();
}

class _YoutubeCardState extends State<YoutubeCard> {
  String _dateFormater() {
    dynamic date;
    if (widget.video.date != null) {
      if (DateTime.now().year - widget.video.date.year != 0) {
        date = DateTime.now().year - widget.video.date.year;
        date = "$date years ago";
      } else if (DateTime.now().month - widget.video.date.month != 0) {
        date = (DateTime.now().month - widget.video.date.month).abs();
        date = "$date monthes ago";
      } else if (DateTime.now().day - widget.video.date.day != 0) {
        date = DateTime.now().day - widget.video.date.day;
        date = "$date days ago";
      } else if (DateTime.now().hour - widget.video.date.hour != 0) {
        date = DateTime.now().hour - widget.video.date.hour;
        date = "$date hours ago";
      } else if (DateTime.now().minute - widget.video.date.minute != 0) {
        date = DateTime.now().minute - widget.video.date.minute;
        date = "$date minutes ago";
      } else {
        date = DateTime.now().second - widget.video.date.second;
        date = "$date seconds ago";
      }
    }
    return date == null ? "" : " . "+date;
  }

  String _viewRounder() {
    int views = widget.video.views;
    String viewStr = views.toString();
    int length = viewStr.length;

    String sign;

    //Below 1000 will return the view itself without sign
    if ((views % 1000) == views) {
      return views.toString() + " views";
    }

    //Making sure the length of the views is greater than i, but their difference should not surpase 3.
    for (int i = 3; i < length; i = i + 3) {
      int power = pow(10, i);
      if (length > i && (length - i) <= 3) {
        double f = views / power;
        if (power == pow(10, 3)) {
          sign = "K";
        } else if (power == pow(10, 6)) {
          sign = "M";
        } else if (power == pow(10, 9)) {
          sign = "B";
        }
        return f.round().toString() + sign + " views";
      }
    }
    return views.toString() + " views";
  }

  @override
  Widget build(BuildContext context) {
    const double pad = 15.0;

    String thumbnail = widget.video.thumbnail;
    String title = widget.video.title;
    String avatar = widget.video.avatar;
    String channel = widget.video.channel;
    String date = this._dateFormater();
    String views = this._viewRounder();

    return new Card(
      elevation: 0.0,
      margin: const EdgeInsets.all(pad),
      child: new Column(
        children: <Widget>[
          Image.network(
            thumbnail,
            fit: BoxFit.cover,
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(0.0),
                child: new Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(top: pad),
                      child: new CircleAvatar(
                        backgroundImage: new NetworkImage(avatar),
                        radius: 24.0,
                      ),
                    ),
                    new Expanded(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.only(
                                left: pad, right: pad, top: pad),
                            child: new Text(
                              title,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 17.8),
                            ),
                          ),
                          new Padding(
                            padding: EdgeInsets.only(left: pad),
                            child: new Text(
                              "$channel . $views $date",
                              style: new TextStyle(
                                  color: Colors.grey[700], fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Icon(
                      Icons.more_vert,
                      color: Colors.grey[700],
                      size: 25.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
