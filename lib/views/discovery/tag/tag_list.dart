import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:articlest/model/index.dart';
import 'package:articlest/widgets/scroll_list_view.dart';
import 'package:articlest/services/tag.service.dart';
import './tag_detail.dart';

class TagListLayout extends StatefulWidget {
  @override
  _TagLayoutState createState() => new _TagLayoutState();
}

class _TagLayoutState extends State<TagListLayout> {
  List<TagModel> _tags = [];
  int _page = 1;
  int _total = 0;

  @override
  void initState() {
    _getTagList(page: 1);
    super.initState();
  }

  Future<bool> _getTagList({int page = 1}) async {
    return await TagService.getTagList(page: page, size: 30).then((res) {
      setState(() {
        _page = page;
        _total = res.data.tags.totalCount;
        _tags.addAll(res.data.tags.nodes);
      });
    });
  }

  _handleRefresh() async {
    _tags = [];
    await _getTagList(page: 1);
  }

  _handleItemTap(TagModel tag) {
    Navigator.of(context).push(new CupertinoPageRoute(builder: (context) {
      return new TagDetailLayout(tag);
    }));
  }

  @override
  Widget build(BuildContext context) {
    if (_tags.length == 0) {
      return new Center(
        child: new Text('加载中...'),
      );
    }

    return ScrollListView(
      total: _total,
      onLoadMore: () {
        return _getTagList(page: _page + 1);
      },
      onRefesh: () {
        return _handleRefresh();
      },
      child: ListView.builder(
        itemCount: _tags.length,
        padding: const EdgeInsets.all(3.0),
        itemBuilder: (BuildContext context, int index) {
          return _buildTag(index);
        },
      ),
    );
  }

  Widget _buildTag(int i) {
    String name = _tags[i].name;
    return new Card(
      elevation: 3.0,
      child: new InkWell(
          onTap: () {
            _handleItemTap(_tags[i]);
          },
          child: new Container(
            padding: EdgeInsets.all(12.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(name),
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
