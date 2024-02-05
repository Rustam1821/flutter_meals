import 'package:flutter/material.dart';

import '../widgets/filter_item.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree] ?? false;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree] ?? false;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian] ?? false;
    _veganFilterSet = widget.currentFilters[Filter.vegan] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }

          Navigator.of(context).pop({
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
