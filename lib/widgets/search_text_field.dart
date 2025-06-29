import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../views/home/recipe_view_model.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RecipeViewModel>(context, listen: false);
    return TextField(
      onChanged: viewModel.updateSearch,
      decoration: const InputDecoration(
        labelText: AppConstants.searchHint,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
    );
  }
}

