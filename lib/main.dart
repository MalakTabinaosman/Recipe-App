
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';
import 'views/home/recipe_view_model.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RecipeViewModel()..loadFavorites()..loadRecipes(),
      child: const RecipeApp(),
    ),
  );
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}