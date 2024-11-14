import 'package:flutter/material.dart';
import 'package:tip_calculater/top_navigation.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  num resultP = 00.00;
  num resultTip = 00.00;
  num resultTotal = 00.00;
  late num flag = 0;
  late int tip = 0;
  late int fixTip = 0;
  late num cmTip = 0;
  TextEditingController totalBillController = TextEditingController();
  TextEditingController customTipController = TextEditingController();
  int person = 1;
  bool isCustomTips = false;
  @override
  void initState() {
    super.initState();
    increaseNum();
    decreaseNum();
    submitCustomTip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const TopNavPageScreen(),
              calculaterScreen(),
              billEnterScreen(),
              chooseTipScreen(),
              splitTotalButton()
            ],
          ),
        ),
      ),
    );
  }

  calculaterScreen() {
    return Container(
      width: 350,
      height: 260,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
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
                resultP.toStringAsFixed(2).toString(),
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
                        '$resultTotal',
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
                      '$resultTip',
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.all(0),
          child: const Column(
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
          width: 280,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 2,
                    offset: const Offset(0, -3))
              ]),
          child: Row(
            children: [
              SizedBox(
                  child: Image.asset(
                "assets/icons/dollar.png",
                width: 20,
                height: 20,
              )),
              SizedBox(
                  width: 200,
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
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            margin: const EdgeInsets.only(top: 40),
            child: const Column(
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
          ),
          Container(
            margin: const EdgeInsets.all(0),
            width: 278,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        fixTip = 10;
                        submitCustomTip();
                      },
                      child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF03C9BD)),
                          child: const Center(
                              child: Text(
                            "10%",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
                    ),
                    InkWell(
                      onTap: () {
                        fixTip = 15;
                        submitCustomTip();
                      },
                      child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF03C9BD)),
                          child: const Center(
                              child: Text(
                            "15%",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))),
                    ),
                    InkWell(
                      onTap: () {
                        fixTip = 20;
                        submitCustomTip();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF03C9BD)),
                        child: const Center(
                            child: Text(
                          "20%",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [buttonCustomTip()],
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
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Stack(
            children: [
              InkWell(
                onTap: (){
                  isCustomTips = false;
                  setState(() {});
                },
                child: Container(
                  width: 278,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset: const Offset(0, -3))
                      ]),
                  child: Row(
                    children: [
                      const SizedBox(
                          child: Icon(Icons.percent, weight: 20,)),
                      SizedBox(
                          width: 200,
                          child: TextField(
                            controller: customTipController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 20),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ))
                    ],
                  ),
                ),
              ),
              isCustomTips
                  ? Container()
                  : InkWell(
                      onTap: () {
                        isCustomTips = true;
                        setState(() {});
                      },
                      child: Container(
                        width: 278,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF03C9BD)),
                        child: const Center(
                            child: Text(
                          "Custom Tip",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  splitTotalButton() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(0),
            child: const Column(
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
          ),
          Container(
            margin: const EdgeInsets.all(0),
            width: 268,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    flag = decreaseNum();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
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
                  width: 147,
                  height: 59,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Center(
                      child: Text(
                    '$person',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ),
                InkWell(
                  onTap: () {
                    flag = increaseNum();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Color(0xFF03C9BD),
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10))),
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
          ),
        ],
      ),
    );
  }

  increaseNum() {
    person++;
    submitCustomTip();
  }

  decreaseNum() {
    if (person > 1) {
      person--;
      submitCustomTip();
    } else {
      person = 1;
    }
  }

  submitCustomTip() {
    if (totalBillController.text != "") {
      resultTotal = double.parse(totalBillController.text.toString());
      tip = int.parse(customTipController.text.toString())>=1 ? int.parse(customTipController.text.toString()) : fixTip;
      resultTip = resultTotal * (tip / 100);
      cmTip = resultTotal + resultTip;
      resultP = cmTip / person;
      setState(() {});
    } else {
      person = 1;
    }
  }
}
