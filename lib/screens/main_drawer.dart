import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/main_drawer_header.dart';
import 'package:flutter_meals_app/widgets/main_drawer_item.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onDrawerItemSelected});

final void Function(String) onDrawerItemSelected;

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
              onDrawerItemSelected: onDrawerItemSelected),
          MainDrawerItem(
              icon: Icons.settings,
              title: "Filters",
              identifier: "filter",
              onDrawerItemSelected: onDrawerItemSelected),
        ],
      ),
    );
  }
}
