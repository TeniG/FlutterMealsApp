import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meals.dart';
import 'package:flutter_meals_app/provider/favourite_meals_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  Widget getSectionTitleWidget(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  List<Widget> getSectionDetailsWidget(
      BuildContext context, List<String> list) {
    List<Widget> widgetList = [];

    for (final str in list) {
      widgetList.add(
        Text(
          str,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }

    return widgetList;
  }

  Widget getTypeOFMeal(BuildContext context, Meal meal) {
    String glutenFree = (meal.isGlutenFree) ? "Gluten-Free" : "";
    String lactoseFree = (meal.isLactoseFree) ? "Lactose-Free" : "";
    String vegan = (meal.isVegan) ? "Vegan" : "";
    String vegeterian = (meal.isVegetarian) ? "Vegeterian" : "";

    String typeOfMeal = "$glutenFree, $lactoseFree, $vegan, $vegeterian";

    return Text(
      typeOfMeal,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealProvider);
    final isMealFavourite = favouriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              //favouriteMealProvider.notifier give access to StateNotifier class
              final isMealAdded = ref
                  .read(favouriteMealProvider.notifier)
                  .toggleFavouriteMeal(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text((isMealAdded)
                      ? "Meal added as Favourite"
                      : " Meal no longer Favourite")));
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                    turns: Tween<double>(begin: 0.8, end: 1).animate(animation), 
                    child: child,); //how should it transition
              },
              child: Icon(
                (isMealFavourite) ? Icons.star : Icons.star_border,
                key: ValueKey(isMealFavourite), // to intimate flutter that same type of widget but value is different.
              ),
            ),
            color: (isMealFavourite) ? Colors.yellow : Colors.grey,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 14),
            getSectionTitleWidget(context, "Meal Type"),
            const SizedBox(height: 14),
            getTypeOFMeal(context, meal),
            const SizedBox(height: 14),
            getSectionTitleWidget(context, "Ingredients"),
            const SizedBox(height: 14),
            ...getSectionDetailsWidget(context, meal.ingredients),
            const SizedBox(height: 24),
            getSectionTitleWidget(context, "Steps"),
            const SizedBox(height: 14),
            ...getSectionDetailsWidget(context, meal.steps),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
