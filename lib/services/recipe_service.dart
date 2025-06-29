import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/data/models/recipes_model.dart';
import '../constants/constants.dart';

class RecipeService {
  Future<List<RecipeModel>> fetchRecipes({String query = ''}) async {
    final url = Uri.parse("${AppConstants.baseUrl}$query");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final meals = data['meals'];
      if (meals == null) return [];

      return List<RecipeModel>.from(
        meals.map((json) => RecipeModel.fromJson(json)),
      );
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}

