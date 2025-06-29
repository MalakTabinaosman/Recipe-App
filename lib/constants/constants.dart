import 'package:flutter/material.dart';

class AppConstants {
  static const String baseUrl = "https://www.themealdb.com/api/json/v1/1/search.php?s=";
  static const String appName = "🍽 Recipe App";
  static const String searchHint = "Search Recipes";
  static const String onboardingTitle1 = "Discover New Recipes";
  static const String onboardingTitle2 = "Save Your Favorites";
  static const String onboardingDesc1 = "Find delicious and easy-to-cook meals.";
  static const String onboardingDesc2 = "Keep the recipes you love in one place.";
}

class AppColors {
  static const Color primaryColor = Colors.orange;
  static const Color backgroundColor = Color(0xFFFFF3E0);
  static const Color textColor = Colors.black87;
  static const Color favoriteColor = Colors.red;
  static const Color splashTextColor = Colors.deepOrange;
}
