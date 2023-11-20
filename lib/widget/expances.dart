import 'package:expence_tracker/modolu/expance.dart';
import 'package:expence_tracker/widget/chart/chart.dart';
import 'package:expence_tracker/widget/expances_list/expances_list.dart';
import 'package:expence_tracker/widget/new_expance.dart';
import 'package:flutter/material.dart';

class Expances extends StatefulWidget {
  const Expances({super.key});
  @override
  State<Expances> createState() {
    return _ExpancesState();
  }
}

class _ExpancesState extends State<Expances> {
  final List<Expance> _registeredExpances = [
    Expance(
        title: 'flutter course',
        amount: 499.0,
        date: DateTime.now(),
        catagory: Catagory.work),
    Expance(
        title: 'pizza',
        amount: 150.0,
        date: DateTime.now(),
        catagory: Catagory.food),
  ];

  void _openAddExpanceOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpance(onAddExpense: _addExpence),
    );
  }

  void _addExpence(Expance expance) {
    setState(() {
      _registeredExpances.add(expance);
    });
  }

  void _removeExpence(Expance expance) {
    final expanceIndex = _registeredExpances.indexOf(expance);
    setState(() {
      _registeredExpances.remove(expance);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text('Expance Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpances.insert(expanceIndex, expance);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.height;

    Widget mainContent = const Center(
      child: Text('No expences found. Start adding some!'),
    );
    if (_registeredExpances.isNotEmpty) {
      mainContent = ExpancesList(
        expance: _registeredExpances,
        onRemoveExpence: _removeExpence,
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter ExpanceTracker'), actions: [
        IconButton(
          onPressed: _openAddExpanceOverlay,
          icon: const Icon(Icons.add),
        ),
      ]),
      body: width > 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpances),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpances)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
