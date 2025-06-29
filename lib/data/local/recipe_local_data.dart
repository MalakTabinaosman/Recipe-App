import 'dart:convert';
import 'package:recipe_app/data/models/recipes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RecipeLocalDataSource {
  static const String _key = 'favorites';

  Future<void> saveFavoriteRecipes(List<RecipeModel> recipes) async {
    final prefs = await SharedPreferences.getInstance();
    final data = recipes.map((e) => e.toJson()).toList();
    prefs.setString(_key, jsonEncode(data));
  }

  Future<List<RecipeModel>> getFavoriteRecipes() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    if (data == null) return [];
    final List decoded = jsonDecode(data);
    return decoded.map((e) => RecipeModel.fromJson(e)).toList();
  }
}
