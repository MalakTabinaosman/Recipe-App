import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/constants.dart';
import '../../widgets/recipe_tile.dart';
import '../../widgets/search_text_field.dart';
import 'recipe_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RecipeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchTextField(),
          ),
          if (viewModel.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (viewModel.filteredRecipes.isEmpty)
            const Center(child: Text('No Recipes Found'))
          else
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.filteredRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = viewModel.filteredRecipes[index];
                  return RecipeTile(recipe: recipe);
                },
              ),
            ),
        ],
      ),
    );
  }
}
