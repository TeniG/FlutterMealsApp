import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  FilterItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.itemIdentifier,
      required this.isItemChecked,
      required this.onItemCheckedChanged});

  final String title;
  final String subtitle;
  final String itemIdentifier;
  bool isItemChecked;
  final void Function(String, bool) onItemCheckedChanged;

  @override
  State<StatefulWidget> createState() {
    return _FilterItemState();
  }
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      subtitle: Text(widget.subtitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      value: widget.isItemChecked,
      onChanged: (isChecked) {
        widget.onItemCheckedChanged(widget.itemIdentifier, isChecked);
        setState(() {
          widget.isItemChecked = isChecked;
        });
      },
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
