import 'package:flutter/material.dart';
import 'package:articlest/views/discovery/tag/tag_list.dart';
import 'package:articlest/views/subscribe/feed_list.dart';

class TabViewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TabBarView(
      children: <Widget>[new FeedListLayout(), new TagListLayout()],
    );
  }
}
