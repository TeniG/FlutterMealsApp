import 'package:flutter/material.dart';

class MealsItemTrait extends StatelessWidget {
  const MealsItemTrait({super.key, required this.icon, required this.duration});

  final IconData icon;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 12, color: Colors.white),
        const SizedBox(width: 4),
        Text(duration, style: const TextStyle(color: Colors.white))
      ],
    );
  }
}
