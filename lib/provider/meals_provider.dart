import 'package:flutter_meals_app/data/category_dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Provider should be used for static data
final mealsProvider = Provider((ref) {
  return dummyMeals;
});