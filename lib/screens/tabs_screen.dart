import 'package:flutter/material.dart';
import 'package:flutter_meals_app/data/category_dummy_data.dart';
import 'package:flutter_meals_app/screens/categories_screen.dart';
import 'package:flutter_meals_app/screens/filter_screen.dart';
import 'package:flutter_meals_app/screens/main_drawer.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';
import 'package:flutter_meals_app/models/meals.dart';

import 'package:flutter_meals_app/utils/constants.dart';

const kInitialFilters = {
  Filter.gluttenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegeterian: false,
};

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
  Map<Filter, bool> _selectedFilters = kInitialFilters;

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

//async await is required to get the future result
  void _onDrawerItemSelected(String identifier) async {
    Navigator.of(context).pop();
    if (identifier != "meals") {
      var filterResult = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => FilterScreen()));

      setState(() {
        _selectedFilters = filterResult ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.gluttenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    String activeTabTitle = "Categories";

    Widget activePage = CategoriesScreen(
        onToggleMealFavrourite: _toggleMealFavrourite,
        availableMeals: availableMeals);

    if (_selectedIndex == 1) {
      activePage = MealsScreen(
          title: "",
          meals: favouriteMeals,
          onToggleMealFavrourite: _toggleMealFavrourite);
      activeTabTitle = "Favourite Meals";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeTabTitle)),
      drawer: MainDrawer(onDrawerItemSelected: _onDrawerItemSelected),
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
