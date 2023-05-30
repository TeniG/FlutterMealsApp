import 'package:flutter/material.dart';
import 'package:flutter_meals_app/data/category_dummy_data.dart';
import 'package:flutter_meals_app/models/category.dart';
import 'package:flutter_meals_app/models/meals.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';

class CategoriesGridItem extends StatelessWidget {
  const CategoriesGridItem({super.key, required this.category});

  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("${category.id} - ${category.title} is tapped");

        List<Meal> selectedMeal = [];
        for(Meal meal in dummyMeals) {
          if (meal.categories.contains(category.id)) {
            selectedMeal.add(meal);
          }
        }
        print("Length : ${selectedMeal.length}");
        MealsScreen(title: category.title,meals: selectedMeal);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
