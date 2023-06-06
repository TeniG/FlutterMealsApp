import 'package:flutter/material.dart';

class MainDrawerHeader extends StatelessWidget {
  const MainDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Theme.of(context).colorScheme.primaryContainer,
        Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
      ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
      child: Row(
        children: [
          Icon(Icons.fastfood,
              size: 48, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 16),
          Text("Cooking up !",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary))
        ],
      ),
    );
  }
}
