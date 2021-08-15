import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:fitness_pal/size_config.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  DateTime _selectedDate = DateTime.now();
  List<DateTime> _inactiveDateList = [];
  List<DateTime> _activeDates = [];
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
                Center(
                  child: Text("Stats", style: TextStyle(color: Colors.black)),
                ),
                DatePicker(
                  DateTime.now().subtract(Duration(days: 5)),
                  initialSelectedDate: _selectedDate,
                  onDateChange: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  activeDates: _activeDates,
                  //inactiveDates: _inactiveDateList,
                  daysCount: 15,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text("Today\'s Report"),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
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
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.ac_unit_outlined),
                                    SizedBox(
                                      width: getProportionateScreenWidth(5),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("226"),
                                        Text("Calories burn")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.ac_unit_outlined),
                                    SizedBox(
                                      width: getProportionateScreenWidth(5),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("226"),
                                        Text("Calories burn")
                                      ],
                                    )
                                  ],
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
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.ac_unit_outlined),
                                    SizedBox(
                                      width: getProportionateScreenWidth(5),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("226"),
                                        Text("Calories burn")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.ac_unit_outlined),
                                    SizedBox(
                                      width: getProportionateScreenWidth(5),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("226"),
                                        Text("Calories burn")
                                      ],
                                    )
                                  ],
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
                  height: getProportionateScreenHeight(20),
                ),
                Text("Today\'s Plan"),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Activity"),
                    Text("View all"),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                TodaysPlan(),
                TodaysPlan(),
                TodaysPlan(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Meals"),
                    Text("View all"),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                TodaysPlan(),
                TodaysPlan(),
                TodaysPlan(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodaysPlan extends StatelessWidget {
  const TodaysPlan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 0.8),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.access_alarm_outlined),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Squats"),
                Text("10 sets of Squats"),
              ],
            ),
            Text("10:00 AM")
          ],
        ),
      ),
    );
  }
}
