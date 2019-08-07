import 'package:flutter/material.dart';

class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.all(12.0),
      indicatorSize: TabBarIndicatorSize.label,
      tabs: <Widget>[
        new Tab(
          text: '订阅',
        ),
        new Tab(
          text: '发现',
        )
      ],
    );
  }
}
