import 'package:fitness_pal/screens/main_screen/main_screen.dart';
import 'package:fitness_pal/size_config.dart';
import 'package:flutter/material.dart';

class WorkOutScreen extends StatefulWidget {
  const WorkOutScreen({Key? key}) : super(key: key);

  @override
  _WorkOutScreenState createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
  List<Map<String, dynamic>> featuredList = [
    {
      "title": "Body Workout",
      "time": "40",
      "imgURL": "assets/images/body-workout.jpeg"
    },
    {
      "title": "Fitness Workout",
      "time": "30",
      "imgURL": "assets/images/fitness-workouts.jpeg"
    },
    {
      "title": "Yoga Workout",
      "time": "60",
      "imgURL": "assets/images/body-workout.jpeg"
    },
    {
      "title": "Body Workout",
      "time": "50",
      "imgURL": "assets/images/body-workout.jpeg"
    },
    {
      "title": "Body Workout",
      "time": "50",
      "imgURL": "assets/images/body-workout.jpeg"
    },
  ];
  List<Map<String, dynamic>> planSet = [
    {
      "title": "Press",
      "time": "40",
      "imgURL": "assets/images/triceps-dips.jpeg"
    },
    {"title": "Yoga", "time": "30", "imgURL": "assets/images/situps.jpeg"},
    {
      "title": "Yoga Workout",
      "time": "60",
      "imgURL": "assets/images/press-2.jpeg"
    },
    {
      "title": "Body Workout",
      "time": "50",
      "imgURL": "assets/images/body-workout.jpeg"
    },
    {
      "title": "Body Workout",
      "time": "50",
      "imgURL": "assets/images/body-workout.jpeg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => MainScreen(currPage: 0)),
                (route) => false);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_outline_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Workouts",
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(18),
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.28,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FeaturedWorkoutCard(
                          title: featuredList[index]["title"],
                          time: featuredList[index]["time"] + " min",
                          imgURL: featuredList[index]["imgURL"],
                          index: index,
                        );
                      }),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Plans set ",
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(18),
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.28,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: planSet.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PlanSet(
                          title: planSet[index]["title"],
                          time: "",
                          index: index,
                          imgURL: planSet[index]["imgURL"],
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeaturedWorkoutCard extends StatelessWidget {
  final String title, time, imgURL;
  final int index;
  const FeaturedWorkoutCard({
    Key? key,
    required this.index,
    required this.title,
    required this.time,
    required this.imgURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.screenWidth * 0.5,
        height: SizeConfig.screenHeight * 0.25,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.grey.shade400, width: 1.2)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$title ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "$time ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: SizeConfig.screenWidth * 0.5,
                height: SizeConfig.screenHeight * 0.22,
                child: Image.asset(
                  imgURL,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ));
  }
}

class PlanSet extends StatelessWidget {
  final String title, time, imgURL;
  final int index;
  const PlanSet({
    Key? key,
    required this.index,
    required this.title,
    required this.time,
    required this.imgURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.screenWidth * 0.5,
        height: SizeConfig.screenHeight * 0.25,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.grey.shade400, width: 1.2)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$title ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "$time ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: SizeConfig.screenWidth * 0.5,
                height: SizeConfig.screenHeight * 0.22,
                child: Image.asset(
                  imgURL,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ));
  }
}
