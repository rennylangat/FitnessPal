import 'package:fitness_pal/size_config.dart';
import 'package:flutter/material.dart';

class WorkOutScreen extends StatefulWidget {
  const WorkOutScreen({Key? key}) : super(key: key);

  @override
  _WorkOutScreenState createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
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
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_outlined,
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
                  height: SizeConfig.screenHeight * 0.25,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            width: SizeConfig.screenWidth * 0.4,
                            height: SizeConfig.screenHeight * 0.22,
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    color: Colors.grey.shade600, width: 1.2)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Body Workout number ${index + 1}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ));
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
