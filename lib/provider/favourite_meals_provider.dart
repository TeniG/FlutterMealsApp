import 'package:flutter_meals_app/models/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteMealProvider extends StateNotifier<List<Meal>> {
  FavouriteMealProvider() : super([]);

  //Note: state consist of List of meals which cannot be edited so add/remove in list won't work.
  bool toggleFavouriteMeal(Meal m) {
    final isMealFavourite = state.contains(m);

    if (isMealFavourite) {
      //new list is return using where method
      state = state.where((meal) => meal.id == m.id).toList();
      return false;
    } else {
      // assigned new list along with new meal.
      state = [...state, m];
      return true;
    }
  }
}

final favouriteMealProvider =
    // StateNotifierProvider Parameter
    // First Parameter : Provider which would be called.
    // Second Parameter:  Data which Provider will return 
    StateNotifierProvider<FavouriteMealProvider, List<Meal>>((ref) {
      return FavouriteMealProvider();
    }
);
