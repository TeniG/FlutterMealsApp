import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/filter_item.dart';
import 'package:flutter_meals_app/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  FilterScreen({super.key});

  bool _isGluttenFreeFilterSet = false;
  bool _isLactoseFreeFilterSet = false;
  bool _isVeganFilterSet = false;
  bool _isVegeterianFilterSet = false;

  void onItemCheckedChanged(String itemIdentifier, bool isChecked) {
    print("$itemIdentifier -  $isChecked");

    switch (itemIdentifier) {
      case "glutten-free":
        _isGluttenFreeFilterSet = isChecked;
        break;
      case "lactose-free":
        _isLactoseFreeFilterSet = isChecked;
        break;
      case "vegan":
        _isVeganFilterSet = isChecked;
        break;
      case "vegeterian":
        _isVegeterianFilterSet = isChecked;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filtersProvider);

    _isGluttenFreeFilterSet = activeFilter[Filter.gluttenFree]!;
    _isLactoseFreeFilterSet = activeFilter[Filter.lactoseFree]!;
    _isVeganFilterSet = activeFilter[Filter.vegan]!;
    _isVegeterianFilterSet = activeFilter[Filter.vegeterian]!;

    return Scaffold(
      appBar: AppBar(title: const Text("Filters")),
      body: WillPopScope(
        onWillPop: () async {
          //Consummer added so we no need to send the data back.
          ref.read(filtersProvider.notifier).setSelectedFilters({
            Filter.gluttenFree: _isGluttenFreeFilterSet,
            Filter.lactoseFree: _isLactoseFreeFilterSet,
            Filter.vegan: _isVeganFilterSet,
            Filter.vegeterian: _isVegeterianFilterSet
          });

          // //This value will be sent to the screen from where it was pushed/launched.
          // Navigator.of(context).pop({
          //   Filter.gluttenFree: _isGluttenFreeFilterSet,
          //   Filter.lactoseFree: _isLactoseFreeFilterSet,
          //   Filter.vegan: _isVeganFilterSet,
          //   Filter.vegeterian: _isVegeterianFilterSet
          // });
          //return false; // don't call the pop again.
          return true;
        },
        child: Column(
          children: [
            FilterItem(
                title: "Glutten-Free",
                subtitle: "Only include Glutten free meals",
                itemIdentifier: "glutten-free",
                isItemChecked: _isGluttenFreeFilterSet,
                onItemCheckedChanged: onItemCheckedChanged),
            FilterItem(
                title: "Lactose-Free",
                subtitle: "Only include Lactose free meals",
                itemIdentifier: "lactose-free",
                isItemChecked: _isLactoseFreeFilterSet,
                onItemCheckedChanged: onItemCheckedChanged),
            FilterItem(
                title: "Vegan",
                subtitle: "Only include Vegan meals",
                itemIdentifier: "vegan",
                isItemChecked: _isVeganFilterSet,
                onItemCheckedChanged: onItemCheckedChanged),
            FilterItem(
                title: "Vegeterain",
                subtitle: "Only include Vegeterain meals",
                itemIdentifier: "vegeterian",
                isItemChecked: _isVegeterianFilterSet,
                onItemCheckedChanged: onItemCheckedChanged),
          ],
        ),
      ),
    );
  }
}
