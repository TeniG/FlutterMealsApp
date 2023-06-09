import 'package:flutter/material.dart';

class MainDrawerItem extends StatelessWidget {
  const MainDrawerItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.identifier,
      required this.onDrawerItemSelected});

  final String title;
  final String identifier;
  final IconData icon;
  final void Function(String) onDrawerItemSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 4),
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground, fontSize: 24)),
      onTap: () {
        onDrawerItemSelected(identifier);
      },
    );
  }
}
