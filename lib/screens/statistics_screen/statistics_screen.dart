import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:fitness_pal/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  DateTime _selectedDate = DateTime.now();
  List<DateTime> _inactiveDateList = [];
  List<DateTime> _activeDates = [];

  DateFormat format = DateFormat("EEEE, d");
  DateFormat format2 = DateFormat("MMMM, yyyy");
  @override
  Widget build(BuildContext context) {
    for (int i = 1; i < 15; i++) {
      _inactiveDateList.add(DateTime.now().add(Duration(days: i)));
      _activeDates.add(DateTime.now().subtract(Duration(days: i)));
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  title: Center(
                    child: Text("Your Activity",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenHeight(18))),
                  ),
                  trailing: SizedBox(
                    width: SizeConfig.screenWidth * 0.15,
                  ),
                ),

                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text(
                  format2.format(_selectedDate),
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: getProportionateScreenHeight(16)),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                DatePicker(
                  DateTime.now().subtract(Duration(days: 5)),
                  initialSelectedDate: _selectedDate,
                  onDateChange: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  //activeDates: _activeDates,
                  inactiveDates: _inactiveDateList,
                  daysCount: 15,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Text(
                  format.format(_selectedDate) + " Report",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenHeight(18),
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.05,
                      right: SizeConfig.screenWidth * 0.05),
                  child: Container(
                    width: SizeConfig.screenWidth * 0.8,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade400, width: 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TodaysReportCard(
                                num: "266",
                                nutrients: "Calories Burn",
                                icon: FaIcon(
                                  FontAwesomeIcons.fire,
                                  color: Colors.red,
                                ),
                              ),
                              TodaysReportCard(
                                num: "20.5g",
                                nutrients: "Protein",
                                icon: FaIcon(
                                  FontAwesomeIcons.bolt,
                                  color: Colors.yellow.shade800,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TodaysReportCard(
                                num: "29g",
                                nutrients: "Carbs",
                                icon: FaIcon(
                                  FontAwesomeIcons.pizzaSlice,
                                  color: Colors.yellow.shade800,
                                ),
                              ),
                              TodaysReportCard(
                                num: "19g",
                                nutrients: "Fat",
                                icon: FaIcon(
                                  FontAwesomeIcons.hamburger,
                                  color: Colors.yellow.shade800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Text(
                  "Today\'s Plan",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenHeight(18),
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Activity",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                TodaysPlan(
                  title: "Squats",
                  desc: "10 sets of squats",
                  imgURL: "assets/images/squat.png",
                  time: "06:00 AM",
                ),
                TodaysPlan(
                  title: "Cycling",
                  desc: "15km uphill cycling",
                  imgURL: "assets/images/cycling.jpeg",
                  time: "04:00 PM",
                ),
                // TodaysPlan(),
                // TodaysPlan(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Meals",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text(
                      "View all",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                TodaysPlan(
                  title: "Breakfast",
                  desc: "Tea, Bread and an egg",
                  imgURL: "assets/images/pesto_pasta.jpeg",
                  time: "08:00 AM",
                ),
                // TodaysPlan(),
                // TodaysPlan(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodaysReportCard extends StatelessWidget {
  final String num, nutrients;
  final FaIcon icon;
  const TodaysReportCard({
    Key? key,
    required this.num,
    required this.nutrients,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.33,
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.pink.shade100.withOpacity(0.4),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: icon,
              )),
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                num,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenHeight(16)),
              ),
              Text(nutrients)
            ],
          )
        ],
      ),
    );
  }
}

class TodaysPlan extends StatelessWidget {
  final String title, desc, time, imgURL;
  const TodaysPlan({
    Key? key,
    required this.title,
    required this.desc,
    required this.time,
    required this.imgURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 0.8,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.tealAccent.shade200, BlendMode.dstATop),
                    image: AssetImage(imgURL),
                    fit: BoxFit.cover,
                  ),
                  //color: Colors.pinkAccent,
                  border:
                      Border.all(color: Colors.tealAccent.shade400, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              //child: Icon(Icons.access_alarm_outlined),
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(14)),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(4),
                  ),
                  Text(desc),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                time,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
