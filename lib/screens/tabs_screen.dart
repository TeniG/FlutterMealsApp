import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/categories_screen.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';
import 'package:flutter_meals_app/models/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  List<Meal> favouriteMeals = [];

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavrourite(Meal meal) {
    bool isMealExist = favouriteMeals.contains(meal);
    if (isMealExist) {
      setState(() {
        favouriteMeals.remove(meal);
              showSnackBar("Meal is no longer Favourite");

      });
    } else {
      setState(() {
        favouriteMeals.add(meal);
        showSnackBar("Meal marked as Favourite");

      });
    }
  }

  void _onSelectedTab(int tabIndex) {
    setState(() {
      _selectedIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =
        CategoriesScreen(onToggleMealFavrourite: _toggleMealFavrourite);
    String activeTabTitle = "Categories";

    if (_selectedIndex == 1) {
      activePage = MealsScreen(
          title: "",
          meals: favouriteMeals,
          onToggleMealFavrourite: _toggleMealFavrourite);
      activeTabTitle = "Favourite Meals";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeTabTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favouties"),
        ],
        onTap: (value) {
          _onSelectedTab(value);
        },
      ),
    );
  }
}
