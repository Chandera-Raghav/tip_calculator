import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tip_calculater/home_page_screen.dart';

class FlashScreenPage extends StatefulWidget {
  const FlashScreenPage({super.key});
  @override
  State<StatefulWidget> createState() => _FlashScreenPageState();
}

class _FlashScreenPageState extends State<FlashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const HomePageScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(left: 55),
            child: Image.asset("assets/icons/king_taj.png", width: 100, height: 100,),
          ),
          const Text("In INDIA",
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              )),
          Center(
              child: Container(

            margin: EdgeInsets.zero,
            child: Row(children: [
              Image.asset("assets/icons/coock_hat.png", width: 150, height: 150),
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      "Mr ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.orange),
                    ),
                  ),
                  Text(
                    "TIP",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ]),
                Text(
                  "Calculator",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.green),
                ),
              ]),

            ]),
          )),

        ]),
      ),
    );
  }
}
