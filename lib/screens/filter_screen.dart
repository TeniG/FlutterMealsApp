import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/filter_item.dart';
import 'package:flutter_meals_app/utils/constants.dart';

class FilterScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filters")),
      body: WillPopScope(
        onWillPop: () async {
          //This value will be sent to the screen from where it was pushed/launched.
          Navigator.of(context).pop({
            Filter.gluttenFree: _isGluttenFreeFilterSet,
            Filter.lactoseFree: _isLactoseFreeFilterSet,
            Filter.vegan: _isVeganFilterSet,
            Filter.vegeterian: _isVegeterianFilterSet
          });
          return false; // don't call the pop again.
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
