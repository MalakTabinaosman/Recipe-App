import 'package:flutter/material.dart';
import 'package:recipe_app/data/local/recipe_local_data.dart';
import 'package:recipe_app/data/models/recipes_model.dart';


import '../../services/recipe_service.dart';

class RecipeViewModel extends ChangeNotifier {
  final RecipeLocalDataSource _localDataSource = RecipeLocalDataSource();
  final RecipeService _recipeService = RecipeService();

  List<RecipeModel> _allRecipes = [];
  List<RecipeModel> get allRecipes => _allRecipes;

  List<RecipeModel> _favorites = [];
  List<RecipeModel> get favorites => _favorites;

  String _searchQuery = '';
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<RecipeModel> get filteredRecipes {
    if (_searchQuery.isEmpty) {
      return _allRecipes;
    } else {
      return _allRecipes
          .where((recipe) =>
              recipe.title.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  Future<void> loadRecipes([String query = '']) async {
    _isLoading = true;
    notifyListeners();
    try {
      _allRecipes = await _recipeService.fetchRecipes(query: query);
    } catch (_) {
      _allRecipes = [];
    }
    _isLoading = false;
    notifyListeners();
  }

  void updateSearch(String query) {
    _searchQuery = query;
    loadRecipes(query);
  }

  Future<void> loadFavorites() async {
    _favorites = await _localDataSource.getFavoriteRecipes();
    notifyListeners();
  }

  Future<void> toggleFavorite(RecipeModel recipe) async {
    if (_favorites.any((r) => r.id == recipe.id)) {
      _favorites.removeWhere((r) => r.id == recipe.id);
    } else {
      _favorites.add(recipe);
    }
    await _localDataSource.saveFavoriteRecipes(_favorites);
    notifyListeners();
  }

  bool isFavorite(String id) => _favorites.any((r) => r.id == id);
}
