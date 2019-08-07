import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import '../auth/index.dart';
import '../home//index.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => new _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.addAll([
      new Slide(
        title: "FLUTTER",
        description: "balabalabala",
        backgroundColor: Color(0xfff5a623),
      ),
      new Slide(
        title: "DART",
        description: "balabalabala",
        backgroundColor: Color(0xff203152),
      ),
      new Slide(
        title: "WELCOME",
        description: "balabalabala",
        backgroundColor: Color(0xff9932CC),
      )
    ]);
  }

  void onDonePress() async {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => route == null);
  }

  void onSkipPress() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => HomePage()),
        (route) => route == null);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }
}
