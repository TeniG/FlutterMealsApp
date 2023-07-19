import 'package:flutter/material.dart';
import 'package:flutter_meals_app/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterItem extends ConsumerWidget {
  const FilterItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.itemIdentifier,
  });

  final String title;
  final String subtitle;
  final Filter itemIdentifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return SwitchListTile(
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      subtitle: Text(subtitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      value: activeFilters[itemIdentifier]!,
      onChanged: (isChecked) {
        ref.read(filtersProvider.notifier).setFilter(itemIdentifier, isChecked);
      },
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
