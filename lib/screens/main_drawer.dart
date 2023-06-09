import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/filter_screen.dart';
import 'package:flutter_meals_app/widgets/main_drawer_header.dart';
import 'package:flutter_meals_app/widgets/main_drawer_item.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainDrawerState();
  }
}

class _MainDrawerState extends State<MainDrawer> {
  void _onDrawerItemSelected(String identifier) {
    if (identifier == "meals") {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => FilterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const MainDrawerHeader(),
          MainDrawerItem(
              icon: Icons.restaurant_outlined,
              title: "Meals",
              identifier: "meals",
              onDrawerItemSelected: _onDrawerItemSelected),
          MainDrawerItem(
              icon: Icons.settings,
              title: "Filters",
              identifier: "filter",
              onDrawerItemSelected: _onDrawerItemSelected),
        ],
      ),
    );
  }
}
