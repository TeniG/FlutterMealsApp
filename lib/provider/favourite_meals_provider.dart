import 'package:flutter_meals_app/models/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//List<Meal> will be managed by this Notifier.
class FavouriteMealProvider extends StateNotifier<List<Meal>> {
  FavouriteMealProvider() : super([]);// initalizing the List<Meal>

  //Note: state consist of List of meals which cannot be edited so add/remove in list won't work. we should assign new list.
  bool toggleFavouriteMeal(Meal m) {
    //state will hold the data i.e List<Meal>
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
    // Second Parameter:  Data which FavouriteMealProvider will return 
    StateNotifierProvider<FavouriteMealProvider, List<Meal>>((ref) {
      return FavouriteMealProvider();
    }
);
