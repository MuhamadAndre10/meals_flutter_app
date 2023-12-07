import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealsIsFavorite = state.contains(meal);

    if (mealsIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false; // meals removed from favorites
    } else {
      state = [...state, meal];
      return true; // meals added to favorites
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());