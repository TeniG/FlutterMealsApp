import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/categories_screen.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  
  int _selectedIndex = 0;

  void _onSelectedTab(int tabIndex) {
    setState(() {
      _selectedIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    String activeTabTitle = "Categories";

    if (_selectedIndex == 1) {
      activePage = const MealsScreen(
        title: "",
        meals: [],
      );
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
