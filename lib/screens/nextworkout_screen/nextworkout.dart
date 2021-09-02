import 'package:fitness_pal/models/upper_body.dart';
import 'package:fitness_pal/screens/home_screen/home_screen.dart';
import 'package:fitness_pal/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NextWorkOutScreen extends StatefulWidget {
  final int index;

  const NextWorkOutScreen({Key? key, required this.index}) : super(key: key);

  @override
  _NextWorkOutScreenState createState() => _NextWorkOutScreenState();
}

class _NextWorkOutScreenState extends State<NextWorkOutScreen> {
  @override
  Widget build(BuildContext context) {
    DateFormat format = DateFormat("EEEE, d MMMM");
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      child: Icon(
                        Icons.cancel_rounded,
                        size: getProportionateScreenHeight(38),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: SizeConfig.screenWidth * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            format.format(DateTime.now()).toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenHeight(16)),
                          ),
                          Text(
                            "Upper Body",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: getProportionateScreenHeight(24)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timer_rounded,
                                color: Colors.white54,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(10),
                              ),
                              Text(
                                "1 hr",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.2,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return WorkoutDetails(
                          imgURL: upperBody[widget.index][index].imagePath,
                          name: upperBody[widget.index][index].name,
                          instruction:
                              upperBody[widget.index][index].instruction,
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails({
    Key? key,
    required this.imgURL,
    required this.name,
    required this.instruction,
  }) : super(key: key);

  final String imgURL, name, instruction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 50,
              height: 50,
              child: Image.asset(
                imgURL,
                color: Colors.white,
              )),
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: getProportionateScreenHeight(16)),
              ),
              Text(
                instruction,
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
