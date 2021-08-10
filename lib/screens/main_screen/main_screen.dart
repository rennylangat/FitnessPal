import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitness_pal/screens/home_screen/home_screen.dart';
import 'package:fitness_pal/screens/profile_screen/profile_screen.dart';
import 'package:fitness_pal/screens/statistics_screen/statistics_screen.dart';
import 'package:fitness_pal/screens/workout_screen/workout_screen.dart';
import 'package:fitness_pal/size_config.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _widgetOptions = [];
  int _page = 0;

  @override
  void initState() {
    _widgetOptions = <Widget>[
      HomeScreen(),
      WorkOutScreen(),
      StatisticsScreen(),
      ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.teal.shade200,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        buttonBackgroundColor: Colors.teal.shade400,
        height: 60.0,
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            size: 28,
          ),
          Icon(
            Icons.run_circle_outlined,
            size: 28,
          ),
          Icon(
            Icons.bar_chart_outlined,
            size: 28,
          ),
          Icon(
            Icons.person_outline_outlined,
            size: 28,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_page),
        bottom: false,
        top: false,
      ),
    );
  }
}
