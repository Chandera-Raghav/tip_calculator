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
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(left: 55),
          child: Image.asset("assets/icons/king_taj.png", fit: BoxFit.cover,),
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
                Text(
                  "Mr ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.orange),
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
                    fontSize: 50,
                    color: Colors.green),
              ),
            ]),

          ]),
        )),

      ]),
    );
  }
}
