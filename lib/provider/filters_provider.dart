import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  gluttenFree,
  lactoseFree,
  vegan,
  vegeterian,
}

class FiltersProvider extends StateNotifier<Map<Filter, bool>> {
  FiltersProvider()
      : super({
          Filter.gluttenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegeterian: false,
        });

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }

  void setSelectedFilters(Map<Filter, bool> choosenFilter) {
    state = choosenFilter;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProvider, Map<Filter, bool>>(
        (ref) => FiltersProvider());
