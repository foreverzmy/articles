import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:articlest/model/index.dart';
import '../discovery/item/item_list.dart';
import 'package:articlest/bloc/provider.dart';
import 'package:articlest/bloc/viewrer.dart';

class FeedListLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: viewbloc,
      child: _FeedList(),
    );
  }
}

class _FeedList extends StatelessWidget {
  _handleItemTap(BuildContext context, FeedModel feed) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) {
          return new ItemListlayout(feed);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: viewbloc.stream,
      initialData: FeedsModel(nodes: []),
      builder: (BuildContext context, AsyncSnapshot<FeedsModel> snapshot) {
        FeedsModel feeds = snapshot.data;
        if (feeds.totalCount == null && feeds.nodes.length == 0) {
          return Center(
            child: Text('加载中...'),
          );
        }

        return ListView.builder(
          itemCount: feeds.nodes.length,
          padding: const EdgeInsets.all(3.0),
          itemBuilder: (context, index) {
            return _buildFeed(context, feeds.nodes[index]);
          },
        );
      },
    );
  }

  Widget _buildFeed(BuildContext context, FeedModel feed) {
    return new Card(
      elevation: 3.0,
      child: InkWell(
          onTap: () {
            _handleItemTap(context, feed);
          },
          child: new Container(
            padding: EdgeInsets.all(12.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(feed.name),
                new Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
              ],
            ),
          )),
    );
  }
}
