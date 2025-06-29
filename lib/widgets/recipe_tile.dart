import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/models/recipe_model.dart';
import '../constants/constants.dart';
import '../views/home/recipe_view_model.dart';
import '../views/recipe_details_screen.dart';

class RecipeTile extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeTile({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RecipeViewModel>(context);
    final isFavorite = viewModel.isFavorite(recipe.id);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RecipeDetailsScreen(recipe: recipe),
            ),
          );
        },
        leading: Image.network(
          recipe.imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(recipe.title),
        subtitle: Text(
          recipe.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: AppColors.favoriteColor,
          ),
          onPressed: () => viewModel.toggleFavorite(recipe),
        ),
      ),
    );
  }
}
