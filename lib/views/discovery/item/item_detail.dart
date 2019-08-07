import "package:flutter/material.dart";
import 'package:flutter_html/flutter_html.dart';
import 'package:articlest/model/index.dart';
import './item_webview.dart';
import 'package:articlest/widgets/loading.dart';
import 'package:articlest/services/item.service.dart';

class ItemDetailLayout extends StatefulWidget {
  final ItemModel item;

  ItemDetailLayout(this.item);

  @override
  _ItemDetailLayoutState createState() => _ItemDetailLayoutState();
}

class _ItemDetailLayoutState extends State<ItemDetailLayout> {
  ItemModel _item;

  @override
  void initState() {
    _item = widget.item;
    super.initState();
    ItemService.getItemDetail(widget.item.id).then((res) {
      var item = res?.data?.item;

      setState(() {
        _item = item;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(_item.title),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Open Link',
        child: new Icon(Icons.link),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) {
              return ItemWebview(_item);
            }),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_item.description == null) {
      return Center(
        child: Loading(),
      );
    }

    return SingleChildScrollView(
      child: new Html(
        data: _item.description,
        useRichText: true,
        padding: EdgeInsets.all(8.0),
        backgroundColor: Colors.white70,
        defaultTextStyle: TextStyle(fontFamily: 'serif'),
        onLinkTap: (url) {
          // open url in a webview
        },
      ),
    );
  }
}
