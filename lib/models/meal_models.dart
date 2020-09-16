import 'dart:convert';

MealModels mealModelFromJson(String str) => MealModels.fromJson(json.decode(str));
String mealToJson(MealModels data) => json.encode(data.toJson());

class MealModels {
  MealModels({
    this.meals,
  });

  List<Meal> meals;

  factory MealModels.fromJson(Map<String, dynamic> json) => MealModels(
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

class Meal {
  Meal({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  String strMeal;
  String strMealThumb;
  String idMeal;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strMeal: json["strMeal"],
    strMealThumb: json["strMealThumb"],
    idMeal: json["idMeal"],
  );

  Map<String, dynamic> toJson() => {
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
    "idMeal": idMeal,
  };
}