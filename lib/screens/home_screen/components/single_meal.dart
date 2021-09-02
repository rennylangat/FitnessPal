import 'package:fitness_pal/size_config.dart';
import 'package:flutter/material.dart';

class SingleMeal extends StatelessWidget {
  final int index;
  SingleMeal({Key? key, required this.index}) : super(key: key);

  final List<Map<String, dynamic>> mealList = [
    {
      "meal": "BREAKFAST",
      "title": "Fruit granola",
      "calories": "271",
      "imgURL": "assets/images/granola.png",
      "time": "10",
      "id": 0,
      "ingredients": "some things to add"
    },
    {
      "meal": "DINNER",
      "title": "Pesto pasta",
      "calories": "612",
      "imgURL": "assets/images/pesto-pasta.jpg",
      "time": "16",
      "id": 1,
      "ingredients": "some things to add"
    },
    {
      "meal": "SNACK",
      "title": "Fruit granola",
      "calories": "271",
      "imgURL": "assets/images/keto_snack.jpeg",
      "time": "10",
      "id": 2,
      "ingredients": "some things to add"
    },
    {
      "meal": "DESSERT",
      "title": "Fruit granola",
      "calories": "271",
      "imgURL": "assets/images/dumbell.png",
      "time": "10",
      "id": 3,
      "ingredients": "some things to add"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: 'meal',
                    child: Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight * 0.3,
                      child: Image.asset(mealList[index]["imgURL"]),
                    )),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Text(
                  "Ingredients",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
