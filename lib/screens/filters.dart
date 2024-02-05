import 'package:flutter/material.dart';

import '../widgets/filter_item.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
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
    );
  }
}
