import 'dart:js_interop';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/fruit.dart';

class FruitDataSource {

  late SharedPreferences _preferences;

  initPreference()async{
    _preferences = await SharedPreferences.getInstance();

  }

  Future<List<Fruit>> loadFruits(){
    List<String>? fruitsString = _preferences.getStringList("fruits");

    return fruitsString != null?
    fruitsString.map((fruit)=>
        Fruit.fromJson(fruit)).toList();
  }

}
