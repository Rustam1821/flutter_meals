import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';
import '../widgets/filter_item.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree] ?? false;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree] ?? false;
    _vegetarianFilterSet = activeFilters[Filter.vegetarian] ?? false;
    _veganFilterSet = activeFilters[Filter.vegan] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: PopScope(
        onPopInvoked: (bool didPop) {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            FilterItem(
              filterSet: _glutenFreeFilterSet,
              titleText: 'Gluten-free',
              subtitleText: 'Only include gluten-free meals.',
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
            ),
            FilterItem(
              filterSet: _lactoseFreeFilterSet,
              titleText: 'Lactose-free',
              subtitleText: 'Only include lactose-free meals.',
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
            ),
            FilterItem(
              filterSet: _vegetarianFilterSet,
              titleText: 'Vegetarian',
              subtitleText: 'Only include vegetarian meals.',
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
            ),
            FilterItem(
              filterSet: _veganFilterSet,
              titleText: 'Vegan',
              subtitleText: 'Only include vegan meals.',
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
