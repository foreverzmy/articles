import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:articlest/model/index.dart';
import 'package:articlest/widgets/scroll_list_view.dart';
import 'package:articlest/services/item.service.dart';
import './item_detail.dart';

class ItemListlayout extends StatefulWidget {
  final FeedModel _feed;

  ItemListlayout(this._feed);

  @override
  _ItemListLayoutState createState() => new _ItemListLayoutState();
}

class _ItemListLayoutState extends State<ItemListlayout> {
  List<ItemModel> _items = [];
  int _page = 1;
  int _total = 0;

  @override
  void initState() {
    _getItemList(page: 1);
    super.initState();
  }

  Future<bool> _getItemList({int page}) async {
    return await ItemService.getItemList(widget._feed.id, page: page, size: 30)
        .then((res) {
      var items = res.data.feed.items;
      setState(() {
        _page = page;
        _items.addAll(items.nodes);
        _total = items.totalCount.toInt();
      });
    });
  }

  _handleRefresh() async {
    _items = [];
    await _getItemList(page: 1);
  }

  _handleItemTap(ItemModel item) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
      return ItemDetailLayout(item);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget._feed.name),
      ),
      body: _buildItemList(),
    );
  }

  Widget _buildItemList() {
    if (_items.length == 0) {
      return Center(
        child: new Text('加载中'),
      );
    }

    return ScrollListView(
      child: ListView.builder(
        itemCount: _items.length,
        padding: const EdgeInsets.all(3.0),
        itemBuilder: (context, index) {
          return _buildItem(index);
        },
      ),
      total: _total,
      onLoadMore: () {
        return _getItemList(page: _page + 1);
      },
      onRefesh: () {
        return _handleRefresh();
      },
    );
  }

  Widget _buildItem(int i) {
    final _item = _items[i];
    return new Card(
      elevation: 3.0,
      child: new InkWell(
        onTap: () {
          _handleItemTap(_item);
        },
        child: new Container(
          padding: EdgeInsets.all(12.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Expanded(
                child: new Text(
                  _item.title.trimLeft(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              new Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
