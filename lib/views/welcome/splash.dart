import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:articlest/widgets/loading.dart';
import './slide_screen.dart';
import '../auth/index.dart';
import '../home/index.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    new Timer(new Duration(seconds: 1), () {
      checkFirstSeen();
    });
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    String token = prefs.getString('token');
    if (_seen) {
      if (token == null) {
        Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => SliderScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Loading.show(context);
    return new Scaffold(
      body: new Center(
        child: Loading(),
      ),
    );
  }
}
