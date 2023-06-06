import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
           MainDrawerHeader(),
           MainDrawerItem(icon: Icons.restaurant_outlined, title: "Meals"),
          MainDrawerItem(icon: Icons.settings, title: "Filters"),

        ],
      ),
    );
  }
}
