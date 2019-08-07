import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildLoading(context);
  }

  static _buildLoading(BuildContext context) {
    return Center(
      child: new Container(
        width: 200.0,
        height: 200.0,
        padding: new EdgeInsets.all(4.0),
        decoration: new BoxDecoration(
          color: Colors.transparent,
          //用一个BoxDecoration装饰器提供背景图片
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                child: SpinKitCubeGrid(color: Theme.of(context).accentColor)),
            new Container(height: 10.0),
            new Container(
              child: new Text(
                '加载中',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<Null> show(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Material(
            color: Colors.transparent,
            child: WillPopScope(
              onWillPop: () => new Future.value(false),
              child: _buildLoading(context),
            ),
          );
          ;
        });
  }
}
