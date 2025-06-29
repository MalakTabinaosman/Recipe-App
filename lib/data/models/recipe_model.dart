class RecipeModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  RecipeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['idMeal'],
      title: json['strMeal'],
      description: json['strInstructions'] ?? '',
      imageUrl: json['strMealThumb'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': id,
      'strMeal': title,
      'strInstructions': description,
      'strMealThumb': imageUrl,
    };
  }
}
