import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  AnimationController _controller;
  var curvedAnimation;
  @override
  void initState() {
   
    animate();
    super.initState();
  }

  void animate() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
   
    curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    
    curvedAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
        _controller.reverse();
      }
    });

    curvedAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
   
    super.dispose();
  }

  void roll() {
    
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rolld"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onDoubleTap: roll,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image(
                      height: 200 - curvedAnimation.value * 200,
                      image: AssetImage(
                          "assets/images/dice-png-$leftDiceNumber.png"),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onDoubleTap: roll,
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image(
                        height: 200 - curvedAnimation.value * 200,
                        image: AssetImage(
                            "assets/images/dice-png-$rightDiceNumber.png"))),
              ))
            ],
          ),
          RaisedButton(
            onPressed: roll,
            child: Text("Roll"),
          )
        ],
      ),
    );
  }
}
