import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  List<Widget> _buildIngredients() {
    List<Widget> ingredientsList = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = recipe['strIngredient$i'];
      final measure = recipe['strMeasure$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredientsList.add(Text('- $ingredient: $measure'));
      }
    }
    return ingredientsList;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image
          Image.network(
            recipe['strMealThumb'] ?? '',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.error, size: 40, color: Colors.red),
          ),
          SizedBox(height: 16),

          //Title
          Text(
            recipe['strMeal'] ?? '',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange.shade900,
            ),
          ),
          SizedBox(height: 24),

          //Ingredients
          Text(
            'Ingredients:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.brown,
            ),
          ),
          SizedBox(height: 10),
          ..._buildIngredients(),
          SizedBox(height: 24),

          //Instructions
          Text(
            'Instructions:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.brown,
            ),
          ),
          SizedBox(height: 10),
          Text(recipe['strInstructions'] ?? ''),
        ],
      ),
    );
  }
}
