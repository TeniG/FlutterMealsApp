import 'package:flutter/material.dart';
import 'package:flutter_meals_app/data/category_dummy_data.dart';
import 'package:flutter_meals_app/models/category.dart';
import 'package:flutter_meals_app/models/meals.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';
import 'package:flutter_meals_app/widgets/categories_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  void _selectedCategory(BuildContext context, Category category) {
    List<Meal> filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) {
        return MealsScreen(
          title: category.title,
          meals: filteredMeals,
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();

    //Explicit Animation - control by us.
    _animationController = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: const Duration(
          milliseconds: 300,
        ));

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (context, child) => SlideTransition( // SlideTransition are how they should animate.
        //poition : Its an animation Offset and not an value between 0 and 1
        // so we use drive method which will give us the value between 0 and 1 along with other two values
        position: Tween(
          //Animation between two values
          begin: const Offset(0, 0.3), // 0 means no offest, 1: 100% animation, offest can be between 0 and 1
          end: const Offset(0, 0),
        ).animate(    //animate used for the CurvedAnimation to use different types of curve
          CurvedAnimation(    
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
    );
  }
}
