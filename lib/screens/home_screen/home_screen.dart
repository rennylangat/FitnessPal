import 'package:fitness_pal/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> mealList = [
    {
      "meal": "BREAKFAST",
      "title": "Fruit granola",
      "calories": "271",
      "imgURL": "assets/images/dumbell.png",
      "time": "10",
    },
    {
      "meal": "DINNER",
      "title": "Pesto pasta",
      "calories": "612",
      "imgURL": "assets/images/dumbell.png",
      "time": "16",
    },
    {
      "meal": "SNACK",
      "title": "Fruit granola",
      "calories": "271",
      "imgURL": "assets/images/dumbell.png",
      "time": "10",
    },
    {
      "meal": "DESSET",
      "title": "Fruit granola",
      "calories": "271",
      "imgURL": "assets/images/dumbell.png",
      "time": "10",
    }
  ];
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateFormat format = DateFormat("EEEE, d MMMM");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: null,
        actions: null,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: SizeConfig.screenHeight * 0.37,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 6,
                            spreadRadius: 6)
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(format.format(now).toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            getProportionateScreenHeight(16))),
                                Text(
                                  "Hello, David",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenHeight(26),
                                      fontWeight: FontWeight.w800),
                                )
                              ],
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black, width: 0.8)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: SizeConfig.screenWidth * 0.43,
                              height: SizeConfig.screenHeight * 0.18,
                              alignment: Alignment.center,
                              child: SfRadialGauge(
                                axes: [
                                  RadialAxis(
                                    minimum: 0,
                                    maximum: 100,
                                    showTicks: false,
                                    showLabels: false,
                                    labelOffset: -20,
                                    annotations: [
                                      GaugeAnnotation(
                                          angle: 90,
                                          axisValue: 5,
                                          positionFactor: 0.1,
                                          widget: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("1732",
                                                  style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              24),
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Colors.black)),
                                              Text("kcal left",
                                                  style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              14),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black))
                                            ],
                                          ))
                                    ],
                                    pointers: [
                                      RangePointer(
                                        value: 50,
                                        cornerStyle: CornerStyle.bothCurve,
                                        width: 10,
                                        sizeUnit: GaugeSizeUnit.logicalPixel,
                                        gradient: SweepGradient(colors: [
                                          Colors.blue.shade800,
                                          Colors.teal.shade800,
                                        ], stops: [
                                          0.25,
                                          0.75
                                        ]),
                                      ),
                                      MarkerPointer(
                                        value: 50,
                                        enableDragging: false,
                                        markerHeight: 10,
                                        markerWidth: 10,
                                        markerType: MarkerType.circle,
                                        color: Color(0xFF583D78),
                                        borderWidth: 2,
                                        borderColor: Colors.white54,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                                width: SizeConfig.screenWidth * 0.46,
                                height: SizeConfig.screenHeight * 0.25,
                                child: ListView(
                                  children: [
                                    CustomProgressBar(
                                      title: "PROTEIN",
                                      amt: 0.1,
                                      remAmt: "250",
                                    ),
                                    CustomProgressBar(
                                      title: "PROTEIN",
                                      amt: 0.1,
                                      remAmt: "250",
                                    ),
                                    CustomProgressBar(
                                      title: "PROTEIN",
                                      amt: 0.1,
                                      remAmt: "250",
                                    ),
                                  ],
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    "MEALS FOR TODAY",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(15),
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.2,
                  padding: EdgeInsets.only(left: 12),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mealList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TodayMeals(
                        meal: mealList[index]["meal"],
                        title: mealList[index]["title"],
                        calories: mealList[index]["calories"],
                        imgURL: mealList[index]["imgURL"],
                        time: mealList[index]["time"],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "YOUR NEXT WORKOUT",
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: getProportionateScreenHeight(14)),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(8),
                          ),
                          Text(
                            "Upper Body",
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(24),
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          Container(
                            width: SizeConfig.screenWidth * 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Image.asset("assets/images/chest.png"),
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Image.asset("assets/images/chest.png"),
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Image.asset("assets/images/chest.png"),
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Image.asset("assets/images/chest.png"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(25),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodayMeals extends StatelessWidget {
  final String meal, title, calories, time, imgURL;
  const TodayMeals({
    Key? key,
    required this.meal,
    required this.title,
    required this.calories,
    required this.time,
    required this.imgURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: SizeConfig.screenWidth * 0.25,
      height: SizeConfig.screenHeight * 0.2,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgURL), fit: BoxFit.contain),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(meal),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(16)),
                  ),
                  Text("$calories kcal"),
                  Text("$time min")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final String title, remAmt;
  final double amt;
  const CustomProgressBar(
      {required this.title, required this.remAmt, required this.amt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.32,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                  color: Colors.grey,
                ),
                alignment: Alignment.centerLeft,
                child: Container(
                  width: SizeConfig.screenWidth * amt,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              Text(
                "$remAmt g left",
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ],
      ),
    );
  }
}
