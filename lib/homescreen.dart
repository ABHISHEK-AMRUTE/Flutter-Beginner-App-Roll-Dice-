import 'package:flutter/material.dart';
import 'dart:math';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  void roll() {
    leftDiceNumber =  Random().nextInt(6)+1;
    rightDiceNumber =  Random().nextInt(6)+1;
    setState(() {});
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
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Image(
                    image: AssetImage(
                        "assets/images/dice-png-$leftDiceNumber.png"),
                  ),
                ),
              ),
              Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Image(
                          image: AssetImage(
                              "assets/images/dice-png-$rightDiceNumber.png"))))
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
