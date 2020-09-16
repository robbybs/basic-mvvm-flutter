import 'package:flutter/material.dart';
import 'package:flutter_parsing_data/models/meal_models.dart';
import 'package:flutter_parsing_data/models/user_model.dart';
import 'package:flutter_parsing_data/viewmodels/meal_viewmodel.dart';

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  List<UserModel> dataUser = new List();
  List<Meal> mealList = new List();

//  void getDataUser() {
//    UserViewModel().getUsers().then((value) {
//      setState(() {
//        dataUser = value;
//      });
//    });
//  }

  void getDataMeal() {
    MealViewModel().getMeals().then((value) {
      setState(() {
        mealList = value.meals;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataMeal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Utama"),
      ),
      body: mealList == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: mealList.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(mealList[i].strMeal),
                  onTap: () {
                    _showToast(context);
                  },
                );
              },
            ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Clicked'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
