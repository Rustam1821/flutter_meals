import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required bool filterSet,
    required titleText,
    required subtitleText,
    required onChanged,
  })  : _filterSet = filterSet,
        _titleText = titleText,
        _subtitleText = subtitleText,
        _onChanged = onChanged;

  final bool _filterSet;
  final String _titleText;
  final String _subtitleText;
  final void Function(bool) _onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _filterSet,
      onChanged: _onChanged,
      title: Text(
        // 'Gluten-free',
        _titleText,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        // 'Only include gluten-free meals.',
        _subtitleText,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
