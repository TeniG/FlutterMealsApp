import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meals.dart';
import 'package:flutter_meals_app/screens/meal_details_screen.dart';
import 'package:flutter_meals_app/widgets/meals_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsListItem extends StatelessWidget {
  const MealsListItem({super.key, required this.meal, required this.onSelectedMeal,});
  final Meal meal;
  final void Function(Meal meal) onSelectedMeal;

  get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  get affordableText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          print("meal tapped: ${meal.title}");
          onSelectedMeal(meal);
        },
        child: Stack(children: [
          Hero(
            tag: meal.id, //unique identifier
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 44),
                color: Colors.black45,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealsItemTrait(
                            icon: Icons.schedule,
                            duration: "${meal.duration} mins"),
                        const SizedBox(width: 12),
                        MealsItemTrait(
                            icon: Icons.work, duration: complexityText),
                        const SizedBox(width: 12),
                        MealsItemTrait(
                            icon: Icons.money, duration: affordableText),
                      ],
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
