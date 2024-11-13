import 'package:flutter/material.dart';
import 'package:tip_calculater/top_navigation.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String resultP = "000";
  String resultTip = "000";
  String resultTotal = "000";
  late var flag = 0;
  late var tip = 0;
  late double cmTip=0;
  TextEditingController totalBillController = TextEditingController();
  int person = 1;
  @override
  void initState() {
    super.initState();
    increaseNum();
    decreaseNum();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              const TopNavPageScreen(),
              calculaterScreen(),
              const SizedBox(
                width: double.infinity,
                height: 5,
              ),
              billEnterScreen(),
              const SizedBox(
                width: double.infinity,
                height: 5,
              ),
              chooseTipScreen(),
              const SizedBox(height: 10, width: double.infinity,),
              buttonCustomTip(),
              const SizedBox(
                width: double.infinity,
                height: 5,
              ),
              splitTotalButton(),
            ],
          ),
        ),
      ),
    );
  }

  calculaterScreen() {
    return Container(
      width: 350,
      height: 212,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
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
                width: 15,
                height: 15,
              ),
              Text(
                resultP,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
          Container(
            width: 340,
            height: 2,
            margin: const EdgeInsets.all(0),
            color: Colors.grey.withOpacity(0.8),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: 100,
              padding: const EdgeInsets.only(top: 15),
              margin: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Total bill", style: TextStyle(fontSize: 20)),
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
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF03C9BD)),
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

  billEnterScreen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Expanded(
          child: Column(
            children: [
              Text(
                "Enter",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                "your bill",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
        Container(
          width: 240,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              SizedBox(
                  child: Image.asset(
                "assets/icons/dollar.png",
                width: 20,
                height: 20,
              )),
              SizedBox(
                  width: 100,
                  child: TextField(
                    controller: totalBillController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(border: InputBorder.none),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  chooseTipScreen() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Column(
    children: [
      Text(
        "Choose",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      Text(
        "your tip",
        style: TextStyle(fontSize: 15),
      )
    ],
          ),
          SizedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: (){
            tip = int.parse('10%');
          },
          child: Container(
              width: 49,
              height: 49,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF03C9BD)),
              child: const Center(
                  child: Text(
                "10%",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))),
        ),
        const SizedBox(width: 10,),
        InkWell(
          onTap: (){
            tip= int.parse('15%');
          },
          child: Container(
              width: 49,
              height: 49,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF03C9BD)),
              child: const Center(
                  child: Text(
                "15%",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))),
        ),
        const SizedBox(width: 10,),
        InkWell(
          onTap: (){tip= int.parse('20%');},
          child: Container(
            width: 49,
            height: 49,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF03C9BD)),
            child: const Center(
                child: Text(
              "20%",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        )
      ],
    ),
          ),
        ]);
  }

  buttonCustomTip() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: (){
              cmTip = int.parse(totalBillController.text) / tip;
              cmTip.toStringAsFixed(2);
              setState(() {

              });
          },
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF03C9BD)),
            child: const Center(
                child: Text(
              "Custom Tip",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }

  splitTotalButton() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Column(
            children: [
              SizedBox(
                child: Text("Split",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                child: Text(
                  "the total",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: (){
                  flag = decreaseNum();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color(0xFF03C9BD),
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(10))),
                  child: const Center(
                      child: Text(
                    "-",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
              Container(
                width: 100,
                height: 49,
                decoration: const BoxDecoration(color: Colors.white),
                child: Center(
                    child: Text(
                  '$person',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )),
              ),
              InkWell(
                onTap: (){
                  flag = increaseNum();

                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color(0xFF03C9BD),
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(10))),
                  child: const Center(
                      child: Text(
                    "+",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  increaseNum(){
    person++;
    setState(() {

    });
  }
  decreaseNum(){
    person>2 ? person-- : person = 1;
    setState(() {

    });
  }
}
