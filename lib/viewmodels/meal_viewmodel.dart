import 'package:flutter_parsing_data/models/meal_models.dart';
import 'package:http/http.dart' as http;

class MealViewModel {
  Future<MealModels> getMeals() async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull("https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data category success");
        final data = mealModelFromJson(hasil.body);
        return data;
      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }
}