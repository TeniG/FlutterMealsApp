import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meals.dart';
import 'package:flutter_meals_app/screens/meal_details_screen.dart';
import 'package:flutter_meals_app/widgets/meals_list_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});
  final List<Meal> meals;
  final String? title;


  void _onSelectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MealDetailsScreen(meal: meal);
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          "ohh could not find anything...",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        const SizedBox(height: 10),
        Text(
          "Please try some other catgory..",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        )
      ]),
    );

    if (meals.isNotEmpty) {
      mainContent = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return MealsListItem(
                meal: meals[index],
                onSelectedMeal: (Meal meal) {
                  _onSelectedMeal(context, meal);
                },
               );
          });
    }

    if (title == null) {
      return mainContent;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: mainContent,
    );
  }
}
