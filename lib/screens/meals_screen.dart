import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meals.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});
  final List<Meal> meals;
  final String title;

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text("ohh could not find anything..."),
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
            return Text(meals[index].title,
            style: const TextStyle(color: Colors.white),);
          });
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: mainContent,
    );
  }
}
