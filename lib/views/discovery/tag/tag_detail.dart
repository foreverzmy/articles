import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:articlest/model/index.dart';
import 'package:articlest/services/tag.service.dart';
import 'package:articlest/services/subscribe.dart';
import 'package:articlest/widgets/scroll_list_view.dart';
import '../item/item_list.dart';

class TagDetailLayout extends StatefulWidget {
  final TagModel _tag;

  TagDetailLayout(this._tag);

  @override
  _TagDetailLayout createState() => new _TagDetailLayout();
}

class _TagDetailLayout extends State<TagDetailLayout> {
  int _totalCount;
  int _page = 1;
  List<FeedModel> _feeds = [];

  @override
  void initState() {
    _getTagFeedList(page: 1);
    super.initState();
  }

  Future<bool> _getTagFeedList({int page}) async {
    return await TagService.getTagFeedList(widget._tag.id, page: page, size: 30)
        .then((res) {
      setState(() {
        _page = page;
        _feeds.addAll(res.data.tag.feeds.nodes);
        _totalCount = res.data.tag.feeds.totalCount.toInt();
      });
    });
  }

  _handleRefresh() async {
    _feeds = [];
    await _getTagFeedList(page: 1);
  }

  // 跳转到 item list 页面
  _handleItemTap(FeedModel feed) {
    Navigator.of(context).push(
      new CupertinoPageRoute(builder: (context) {
        return new ItemListlayout(feed);
      }),
    );
  }

  _handleSubscribeTap(int id) {
    subscrubeService.subscribeFeed(id).then((res) {
      if (res.data.subscribeFeed == true) {
        var newFeed = _feeds.map((feed) {
          if (feed.id == id) feed.isSubscribe = true;
          return feed;
        }).toList();
        setState(() {
          _feeds = newFeed;
        });
      }
    });
  }

  _handleUnsubscribeTap(int id) {
    subscrubeService.unsubscribeFeed(id).then((res) {
      if (res.data.unsubscribeFeed == true) {
        var newFeed = _feeds.map((feed) {
          if (feed.id == id) feed.isSubscribe = false;
          return feed;
        }).toList();
        setState(() {
          _feeds = newFeed;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget._tag.name),
      ),
      body: _buildFeedList(),
    );
  }

  Widget _buildFeedList() {
    if (_feeds.length == 0) {
      return new Center(
        child: new Text('加载中...'),
      );
    }

    return ScrollListView(
      child: ListView.builder(
        itemCount: _feeds.length,
        padding: const EdgeInsets.all(3.0),
        itemBuilder: (context, index) {
          return _buildFeed(index);
        },
      ),
      total: _totalCount,
      onRefesh: () async {
        await _handleRefresh();
      },
      onLoadMore: () {
        return _getTagFeedList(page: _page + 1);
      },
    );
  }

  Widget _buildFeed(int i) {
    final FeedModel _feed = _feeds[i];

    return new Card(
      elevation: 3.0,
      child: new InkWell(
        onTap: () {
          _handleItemTap(_feed);
        },
        child: new Container(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(_feed.name),
              ),
              _buildFavorite(_feed),
            ],
          ),
        ),
      ),
    );
  }

  // 订阅按钮
  Widget _buildFavorite(FeedModel feed) {
    if (feed.isSubscribe) {
      return GestureDetector(
        onTap: () {
          _handleUnsubscribeTap(feed.id);
        },
        child: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        _handleSubscribeTap(feed.id);
      },
      child: Icon(
        Icons.favorite_border,
        color: Colors.black,
      ),
    );
  }
}
