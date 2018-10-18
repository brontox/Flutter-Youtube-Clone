

import 'package:flutter/foundation.dart';

class YoutubeVideo {
  final String thumbnail, avatar, title, channel;
  final DateTime date;
  final int views;

  YoutubeVideo(
      {
      @required this.thumbnail,
      @required this.avatar,
      @required this.channel,
      @required this.title,
      @required this.views,
      this.date
    });
}


