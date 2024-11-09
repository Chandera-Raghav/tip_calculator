import 'package:flutter/material.dart';

class TopNavPageScreen extends StatefulWidget {
  const TopNavPageScreen({super.key});
  @override
  State<StatefulWidget> createState() => _TopNavPageScreenState();
}
class _TopNavPageScreenState extends State<TopNavPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: Image.asset("assets/icons/coock_hat.png", width: 100, height: 100),
        ),
        const SizedBox(
          height: 110,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Text("Mr ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    ),
                    Text("TIP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),)
                  ],
                ),
              ),
              Expanded(child: Text("Calculator", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),))
            ],
          ),
        )
      ],
    );
  }
}