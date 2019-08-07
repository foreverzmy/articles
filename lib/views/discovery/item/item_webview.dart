import "package:flutter/material.dart";
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:articlest/model/item.dart';

class ItemWebview extends StatelessWidget {
  final ItemModel _item;

  const ItemWebview(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(_item.title),
      ),
      body: WebviewScaffold(
        url: _item.link,
        hidden: true,
        withZoom: true,
        withLocalStorage: true,
        withJavascript: true,
      ),
    );
  }
}
