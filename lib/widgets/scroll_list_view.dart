import 'dart:math';
import 'package:flutter/material.dart';

enum LoadMoreStatus {
  /// 空闲中，表示当前等待加载
  idle,

  /// 刷新中，不应该继续加载，等待future返回
  loading,

  /// 刷新失败，刷新失败，这时需要点击才能刷新
  fail,

  /// 没有更多，没有更多数据了，这个状态不触发任何条件
  nomore,
}

/// return true is success
/// return false or null is fail
typedef Future<bool> FutureCallBack();

class ScrollListView extends StatefulWidget {
  final ListView child;

  // 总长度
  final int total;

  /// 上拉加载更多
  final FutureCallBack onLoadMore;

  /// 下拉刷新
  final FutureCallBack onRefesh;

  /// 延迟加载的毫秒时间
  final int loadMoreDelay;

  ScrollListView({
    Key key,
    @required this.child,
    this.total,
    this.onLoadMore,
    this.onRefesh,
    this.loadMoreDelay = 16,
  }) : super(key: key);

  @override
  _ScrollListViewState createState() => _ScrollListViewState();
}

class _ScrollListViewState extends State<ScrollListView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  // final ScrollController _scrollController = new ScrollController();

  LoadMoreStatus loadMoreStatus = LoadMoreStatus.idle;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(ScrollListView old) {
    super.didUpdateWidget(old);
    if (min(widget.total, widget.child.childrenDelegate.estimatedChildCount) ==
        widget.total) {
      loadMoreStatus = LoadMoreStatus.nomore;
    } else {
      loadMoreStatus = LoadMoreStatus.idle;
    }
  }

  Future _handleLoadMore() async {
    if (widget.onLoadMore != null) {
      var success = await widget.onLoadMore();

      setState(() {
        if (success == true) {
          loadMoreStatus = LoadMoreStatus.idle;
        } else {
          loadMoreStatus = LoadMoreStatus.fail;
        }
      });
    }
    return true;
  }

  Future<void> _handleRefresh() async {
    if (widget.onRefesh != null) {
      await widget.onRefesh();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _handleRefresh,
      child: _buildListView(widget.child),
    );
  }

  Widget _buildListView(ListView listView) {
    var delegate = listView.childrenDelegate;
    outer:
    if (delegate is SliverChildBuilderDelegate) {
      SliverChildBuilderDelegate delegate = listView.childrenDelegate;
      if (delegate.estimatedChildCount == 0) {
        break outer;
      }

      var childCount = delegate.estimatedChildCount + 1;
      IndexedWidgetBuilder builder = (context, index) {
        if (index == childCount - 1) {
          return _buildLoadMore();
        }
        return delegate.builder(context, index);
      };

      return ListView.builder(
        itemBuilder: builder,
        addAutomaticKeepAlives: delegate.addAutomaticKeepAlives,
        addRepaintBoundaries: delegate.addRepaintBoundaries,
        itemCount: childCount,
        cacheExtent: listView.cacheExtent,
        controller: listView.controller,
        itemExtent: listView.itemExtent,
        key: listView.key,
        padding: listView.padding,
        physics: listView.physics,
        primary: listView.primary,
        reverse: listView.reverse,
        scrollDirection: listView.scrollDirection,
        shrinkWrap: listView.shrinkWrap,
      );
    } else if (delegate is SliverChildListDelegate) {
      SliverChildListDelegate delegate = listView.childrenDelegate;
      if (delegate.estimatedChildCount == 0) {
        break outer;
      }

      delegate.children.add(_buildLoadMore());

      return ListView(
        children: delegate.children,
        addAutomaticKeepAlives: delegate.addAutomaticKeepAlives,
        addRepaintBoundaries: delegate.addRepaintBoundaries,
        cacheExtent: listView.cacheExtent,
        controller: listView.controller,
        itemExtent: listView.itemExtent,
        key: listView.key,
        padding: listView.padding,
        physics: listView.physics,
        primary: listView.primary,
        reverse: listView.reverse,
        scrollDirection: listView.scrollDirection,
        shrinkWrap: listView.shrinkWrap,
      );
    }
    return listView;
  }

  String _getLoadMoreText() {
    switch (loadMoreStatus) {
      case LoadMoreStatus.fail:
        return "加载失败，请点击重试";
      case LoadMoreStatus.idle:
        return "等待加载更多";
      case LoadMoreStatus.loading:
        return "加载中，请稍候...";
      case LoadMoreStatus.nomore:
        return "没有更多数据啦...";
      default:
        return "没有更多数据啦...";
    }
  }

  Widget _buildLoadMore() {
    return Container(
      alignment: Alignment.center,
      height: 80,
      child: _buildLoadMoreChild(),
    );
  }

  Widget _buildLoadMoreChild() {
    final text = _getLoadMoreText();
    LoadMoreStatus status = loadMoreStatus;
    if (loadMoreStatus == LoadMoreStatus.idle) {
      status = LoadMoreStatus.loading;
      _handleLoadMore();
    }

    switch (status) {
      case LoadMoreStatus.nomore:
        return Text(text);
      case LoadMoreStatus.fail:
        return GestureDetector(
          onTap: () {},
          child: Center(
            child: Text(text),
          ),
        );
      case LoadMoreStatus.idle:
        return Text(text);
      case LoadMoreStatus.loading:
        return Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 33.0,
                height: 33.0,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text),
              ),
            ],
          ),
        );
      default:
        return Text(text);
    }
  }
}
