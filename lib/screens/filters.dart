import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';
import '../widgets/filter_item.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    final notifier = ref.read(filtersProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          FilterItem(
            filterSet: activeFilters[Filter.glutenFree] ?? false,
            titleText: 'Gluten-free',
            subtitleText: 'Only include gluten-free meals.',
            onChanged: (isChecked) {
                notifier.setFilter(Filter.glutenFree, isChecked);
            },
          ),
          FilterItem(
            filterSet: activeFilters[Filter.lactoseFree] ?? false,
            titleText: 'Lactose-free',
            subtitleText: 'Only include lactose-free meals.',
            onChanged: (isChecked) {
                notifier.setFilter(Filter.lactoseFree, isChecked);
            },
          ),
          FilterItem(
            filterSet: activeFilters[Filter.vegetarian] ?? false,
            titleText: 'Vegetarian',
            subtitleText: 'Only include vegetarian meals.',
            onChanged: (isChecked) {
                notifier.setFilter(Filter.vegetarian, isChecked);
            },
          ),
          FilterItem(
            filterSet: activeFilters[Filter.vegan] ?? false,
            titleText: 'Vegan',
            subtitleText: 'Only include vegan meals.',
            onChanged: (isChecked) {
                notifier.setFilter(Filter.vegan, isChecked);
            },
          ),
        ],
      ),
    );
  }
}
