import 'package:flutter/material.dart';
import 'package:tip_calculater/top_navigation.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override  State<StatefulWidget> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String resultP = "000";
  String resultTip = "000";
  String resultTotal = "000";
  TextEditingController totalBillController = TextEditingController();
  String person = "1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
       child:
      Center(
        child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const TopNavPageScreen(),
              calculaterScreen(),
              const SizedBox(width: double.infinity, height: 30,),
              billEnterScreen(),
              const SizedBox(width: double.infinity, height: 30,),

              chooseTipScreen(),
              // const SizedBox(width: double.infinity, height: 30,),
              buttonCustomTip(),
              const SizedBox(width: double.infinity, height: 30,),
              splitTotalButton()
            ],
          ),
      ),
       ),
    );
  }
  calculaterScreen(){
    return Container(
      width: 350,
      height: 250,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          // border: Border.all(color: Colors.black, width: 1),

          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(0, -3))
          ]),
      child: Column(
        children: [
          const Center(
              child: Text(
                "Total p/person",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/dollar.png",
                width: 30,
                height: 30,
              ),
              Text(
                resultP,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ],
          ),
          Container(
            width: 340,
            height: 2,
            margin: const EdgeInsets.all(0),
            color: Colors.grey.withOpacity(0.8),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  padding: const EdgeInsets.only(top: 15),
                  margin: const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Total bill",
                          style: TextStyle(fontSize: 20)),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/dollar.png",
                            width: 20,
                            height: 20,
                            color: const Color(0xFF03C9BD),
                          ),
                          Text(
                            resultTotal,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF03C9BD),
                                fontSize: 35),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  padding: const EdgeInsets.only(top: 15),
                  margin: const EdgeInsets.all(0),
                  child: Column(children: [
                    const Text(
                      "Total tip",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/dollar.png",
                          width: 20,
                          height: 20,
                          color: const Color(0xFF03C9BD),
                        ),
                        Text(
                          resultTip,
                          style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold, color: Color(0xFF03C9BD)),
                        )
                      ],
                    )
                  ]),
                )
              ])
        ],
      ),
    );
  }
  billEnterScreen(){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Column(
            children: [
              Text(
                "Enter",
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "your bill",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        Container(
          width: 240,
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
              SizedBox(child: Image.asset("assets/icons/dollar.png", width: 30, height: 30,)),
              SizedBox( width:130, child: TextField(controller: totalBillController, decoration: const InputDecoration(border: InputBorder.none),))
            ],
          ),
        ),

      ],
    );
  }
  chooseTipScreen() {
    return  Expanded(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Column(children: [
            Text("Choose", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text("your tip", style: TextStyle(fontSize: 20),)
          ],),
          SizedBox(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 60, height: 60, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xFF03C9BD)), child: const Center(child: Text("10%", style: TextStyle(fontSize: 25, color: Colors.white),))),
              Container(width: 60, height: 60, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xFF03C9BD)), child: const Center(child: Text("15%", style: TextStyle(fontSize: 25, color: Colors.white),))),
              Container(width: 60, height: 60, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xFF03C9BD)), child: const Center(child: Text("20%", style: TextStyle(fontSize: 25, color: Colors.white),)),)
            ],
          ),

          ),
        ]));
  }
  buttonCustomTip(){
    return Container(width: 200, height: 60, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xFF03C9BD)), child: const Center(child: Text("Custom Tip", style: TextStyle(fontSize: 20, color: Colors.white),)),);
  }
  splitTotalButton() {
    return SizedBox(child: Row(
      children: [ const Column(children: [SizedBox(child: Text("Split", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),),
        SizedBox(child: Text("the total", style: TextStyle(fontSize: 26, ),), )],),
        Row(children: [Container(width: 60, height: 60, decoration: const BoxDecoration(color: Color(0xFF03C9BD),borderRadius: BorderRadius.horizontal(left: Radius.circular(15))), child: const Center(child: Text("-", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),)),), Container(width: 100, height: 60, decoration: const BoxDecoration(color: Colors.white), child: Center(child: Text(person, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),), Container(width: 60, height: 60, decoration: const BoxDecoration(color: Color(0xFF03C9BD), borderRadius: BorderRadius.horizontal(right: Radius.circular(15))), child: const Center(child: Text("+", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),)),)],),
      ],
    ),);
  }
}
