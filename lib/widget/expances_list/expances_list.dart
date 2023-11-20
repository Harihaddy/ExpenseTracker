import 'package:expence_tracker/modolu/expance.dart';
import 'package:expence_tracker/widget/expances_list/expances_item.dart';

import 'package:flutter/material.dart';

class ExpancesList extends StatelessWidget {
  const ExpancesList(
      {super.key, required this.expance, required this.onRemoveExpence});
  final List<Expance> expance;
  final void Function(Expance expance) onRemoveExpence;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expance.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expance[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.5),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) => onRemoveExpence(expance[index]),
        child: ExpancesItem(expance[index]),
      ),
    );
  }
}
