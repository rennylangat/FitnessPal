import 'package:fitness_pal/size_config.dart';
import 'package:flutter/material.dart';

class SingleMeal extends StatelessWidget {
  const SingleMeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                  tag: 'meal',
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.3,
                    child: Image.asset("assets/images/granola.png"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
