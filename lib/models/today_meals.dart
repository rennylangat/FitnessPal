// To parse this JSON data, do
//
//     final todayMeals = todayMealsFromJson(jsonString);

import 'dart:convert';

TodayMeals todayMealsFromJson(String str) =>
    TodayMeals.fromJson(json.decode(str));

String todayMealsToJson(TodayMeals data) => json.encode(data.toJson());

class TodayMeals {
  TodayMeals({
    required this.name,
    required this.publishAsPublic,
    required this.meals,
    required this.nutrients,
  });

  String name;
  bool publishAsPublic;
  List<Meal> meals;
  Nutrients nutrients;

  factory TodayMeals.fromJson(Map<String, dynamic> json) => TodayMeals(
        name: json["name"],
        publishAsPublic: json["publishAsPublic"],
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
        nutrients: Nutrients.fromJson(json["nutrients"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "publishAsPublic": publishAsPublic,
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
        "nutrients": nutrients.toJson(),
      };
}

class Meal {
  Meal({
    required this.id,
    required this.imageType,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
  });

  int id;
  String imageType;
  String title;
  int readyInMinutes;
  int servings;
  String sourceUrl;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json["id"],
        imageType: json["imageType"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        servings: json["servings"],
        sourceUrl: json["sourceUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageType": imageType,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
      };
}

class Nutrients {
  Nutrients({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
  });

  double calories;
  double protein;
  double fat;
  double carbohydrates;

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
        calories: json["calories"].toDouble(),
        protein: json["protein"].toDouble(),
        fat: json["fat"].toDouble(),
        carbohydrates: json["carbohydrates"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "calories": calories,
        "protein": protein,
        "fat": fat,
        "carbohydrates": carbohydrates,
      };
}
