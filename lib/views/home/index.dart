import 'package:flutter/material.dart';
import './tab.dart';
import './tabview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          leading: new Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/login_logo.png'),
              ),
            ),
          ),
          centerTitle: true,
          title: new TabLayout(),
          actions: <Widget>[],
        ),
        body: new TabViewLayout(),
      ),
    );
  }
}
