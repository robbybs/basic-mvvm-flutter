import 'package:flutter_parsing_data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserViewModel {
  Future<List<UserModel>> getUsers() async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull("https://jsonplaceholder.typicode.com/users"),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data category success");
        final data = userModelFromJson(hasil.body);
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
