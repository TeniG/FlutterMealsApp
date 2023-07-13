import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_meals_app/screens/categories_screen.dart';
import 'package:flutter_meals_app/screens/filter_screen.dart';
import 'package:flutter_meals_app/screens/main_drawer.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';
import 'package:flutter_meals_app/models/meals.dart';
import 'package:flutter_meals_app/utils/constants.dart';
import 'package:flutter_meals_app/provider/meals_provider.dart';
import 'package:flutter_meals_app/provider/favourite_meals_provider.dart';

const kInitialFilters = {
  Filter.gluttenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegeterian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;

 
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
          MaterialPageRoute(
              builder: (ctx) =>
                  FilterScreen(currentFilters: _selectedFilters)));

      setState(() {
        _selectedFilters = filterResult ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    //Consumer
    final dummyMealsFromProvider = ref.watch(mealsProvider);

    final availableMeals = dummyMealsFromProvider.where((meal) {
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
        availableMeals: availableMeals);

    if (_selectedIndex == 1) {
    /* The riverpod package automatically extracts the "state" property
    value from the notifier class that belongs to the provider.Hence,
    ref.watch() yields List<Meal> here (instead of Notifier class )
    */

    // Consumer added
      activePage = MealsScreen(
          title: "",
          meals: ref.watch(favouriteMealProvider)
      );
      
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
