import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/filter_item.dart';
import 'package:flutter_meals_app/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    

    return Scaffold(
      appBar: AppBar(title: const Text("Filters")),
      body: WillPopScope(
        onWillPop: () async {

          //--- commented as we will setFilter as and when filter checkbox is checked. So no need to send data back.

          // //Consummer added so we no need to send the data back.
          // ref.read(filtersProvider.notifier).setSelectedFilters({
          //   Filter.gluttenFree: _isGluttenFreeFilterSet,
          //   Filter.lactoseFree: _isLactoseFreeFilterSet,
          //   Filter.vegan: _isVeganFilterSet,
          //   Filter.vegeterian: _isVegeterianFilterSet
          // });

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
          children: const [
            FilterItem(
                title: "Glutten-Free",
                subtitle: "Only include Glutten free meals",
                itemIdentifier: Filter.gluttenFree,
                ),
            FilterItem(
                title: "Lactose-Free",
                subtitle: "Only include Lactose free meals",
                itemIdentifier: Filter.lactoseFree,
              ),
            FilterItem(
                title: "Vegan",
                subtitle: "Only include Vegan meals",
                itemIdentifier: Filter.vegan,
                ),
            FilterItem(
                title: "Vegeterain",
                subtitle: "Only include Vegeterain meals",
                itemIdentifier: Filter.vegeterian,
                ),
          ],
        ),
      ),
    );
  }
}
