import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meals.dart';

class MealDetailsScreen extends StatelessWidget {
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
    for (final element in list) {
      widgetList.add(
        Text(
          element,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
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
