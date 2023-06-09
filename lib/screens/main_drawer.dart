import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/filter_screen.dart';
import 'package:flutter_meals_app/widgets/main_drawer_header.dart';
import 'package:flutter_meals_app/widgets/main_drawer_item.dart';

import '../utils/constants.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

//async awiat is required to get the future result
  void _onDrawerItemSelected(BuildContext context,String identifier) async {
    Navigator.of(context).pop();
    if (identifier != "meals") {
      var filterResult = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => FilterScreen()));
          print(filterResult);
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
