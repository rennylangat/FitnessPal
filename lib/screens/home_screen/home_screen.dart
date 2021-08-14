import 'package:fitness_pal/screens/main_screen/components/single_meal.dart';
import 'package:fitness_pal/screens/main_screen/main_screen.dart';
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
      "imgURL": "assets/images/granola.png",
      "time": "10",
    },
    {
      "meal": "DINNER",
      "title": "Pesto pasta",
      "calories": "612",
      "imgURL": "assets/images/pesto-pasta.jpg",
      "time": "16",
    },
    {
      "meal": "SNACK",
      "title": "Fruit granola",
      "calories": "271",
      "imgURL": "assets/images/keto_snack.jpeg",
      "time": "10",
    },
    {
      "meal": "DESSERT",
      "title": "Fruit granola",
      "calories": "271",
      "imgURL": "assets/images/dumbell.png",
      "time": "10",
    }
  ];
  List barColors = [Colors.green, Colors.red.shade200, Colors.blue];
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateFormat format = DateFormat("EEEE, d MMMM");
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: null,
      //   actions: null,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 6,
                            spreadRadius: 6)
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(format.format(now).toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            getProportionateScreenHeight(16))),
                                Text(
                                  "Hello, Renny",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenHeight(26),
                                      fontWeight: FontWeight.w800),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => MainScreen(
                                                currPage: 3,
                                              )),
                                      (route) => false);
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/user.jpeg")),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.black, width: 0.8)),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: SizeConfig.screenWidth * 0.4,
                              height: SizeConfig.screenHeight * 0.16,
                              alignment: Alignment.center,
                              child: SfRadialGauge(
                                enableLoadingAnimation: true,
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
                              width: SizeConfig.screenWidth * 0.45,
                              height: SizeConfig.screenHeight * 0.2,
                              child: ListView(
                                children: [
                                  CustomProgressBar(
                                    colors: barColors[0],
                                    title: "PROTEIN",
                                    amt: 0.1,
                                    remAmt: "250",
                                  ),
                                  CustomProgressBar(
                                    colors: barColors[1],
                                    title: "CARBO",
                                    amt: 0.2,
                                    remAmt: "250",
                                  ),
                                  CustomProgressBar(
                                    colors: barColors[2],
                                    title: "VITAMIN C",
                                    amt: 0.15,
                                    remAmt: "250",
                                  ),
                                ],
                              ),
                            )
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
                  padding: const EdgeInsets.only(left: 30),
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
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.23,
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
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.teal.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "YOUR NEXT WORKOUT",
                            style: TextStyle(
                                color: Colors.white70,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                NextWorkOut(
                                  imgURL: "assets/images/chest.png",
                                ),
                                NextWorkOut(
                                  imgURL: "assets/images/back.png",
                                ),
                                NextWorkOut(
                                  imgURL: "assets/images/biceps.png",
                                ),
                                NextWorkOut(
                                  imgURL: "assets/images/chest.png",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
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

class NextWorkOut extends StatelessWidget {
  final String imgURL;
  const NextWorkOut({
    Key? key,
    required this.imgURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          color: Colors.teal.shade700,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Image.asset(
        imgURL,
        color: Colors.white,
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
      margin: EdgeInsets.only(right: 15),
      width: SizeConfig.screenWidth * 0.35,
      height: SizeConfig.screenHeight * 0.22,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue.shade800,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "meals",
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SingleMeal()));
                },
                child: Container(
                  height: SizeConfig.screenHeight * 0.1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imgURL), fit: BoxFit.contain),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                ),
              ),
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
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(14)),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Text("$calories kcal"),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Text("$time min")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final String title, remAmt;
  final double amt;
  final Color colors;
  const CustomProgressBar(
      {required this.title,
      required this.remAmt,
      required this.amt,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.43,
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.25,
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
                    color: colors,
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              Text(
                "$remAmt g left",
                overflow: TextOverflow.clip,
              ),
            ],
          )
        ],
      ),
    );
  }
}
