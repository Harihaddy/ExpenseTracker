import 'package:expence_tracker/modolu/expance.dart';
import 'package:flutter/material.dart';

class ExpancesItem extends StatelessWidget {
  const ExpancesItem(this.expance, {super.key});

  final Expance expance;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expance.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                    '\$${expance.amount.toStringAsFixed(2)}'), // amount 12.8978 as 12.89
                const Spacer(),
                Row(
                  children: [
                    Icon(catagoryIcon[expance.catagory]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expance.formatedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
