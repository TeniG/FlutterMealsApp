import 'package:flutter/material.dart';
import 'package:flutter_meals_app/data/category_dummy_data.dart';
import 'package:flutter_meals_app/models/category.dart';
import 'package:flutter_meals_app/models/meals.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';
import 'package:flutter_meals_app/widgets/categories_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleMealFavrourite,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;
  final void Function(Meal meal) onToggleMealFavrourite;

  void _selectedCategory(BuildContext context, Category category) {

    List<Meal> filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) {
        return MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleMealFavrourite: onToggleMealFavrourite,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //column
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories
          .map((category) => CategoriesGridItem(
                category: category,
                onSelectedCategory: () {
                  _selectedCategory(context, category);
                },
              ))
          .toList(),
    );
  }
}
