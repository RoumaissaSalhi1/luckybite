import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/recipe_card.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  Map<String, dynamic>? recipe;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipe();
  }

  Future<void> fetchRecipe() async {
    setState(() {
      isLoading = true;
    });

    try {
      final data = await ApiService.fetchRandomRecipe();
      setState(() {
        recipe = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load recipe')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Random Recipe'),
        actions: [
          IconButton(
            onPressed: fetchRecipe,
            icon: Icon(Icons.auto_fix_high_outlined),
          ),
        ],
      ),
      backgroundColor: Colors.orange.shade50,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : recipe != null
          ? Padding(
              padding: const EdgeInsets.all(24),
              child: RecipeCard(recipe: recipe!),
            )
          : Center(child: Text('No recipe found')),
    );
  }
}
