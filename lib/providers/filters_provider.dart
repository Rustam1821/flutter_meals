import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

import '../models/meal.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final activeFilters = ref.watch(filtersProvider);
  var meals = ref.watch(mealsProvider);
  return meals
      .where((meal) =>
          (!activeFilters[Filter.glutenFree]! || meal.isGlutenFree) &&
          (!activeFilters[Filter.lactoseFree]! || meal.isLactoseFree) &&
          (!activeFilters[Filter.vegan]! || meal.isVegan) &&
          (!activeFilters[Filter.vegetarian]! || meal.isVegetarian))
      .toList();
});
