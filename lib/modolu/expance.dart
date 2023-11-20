import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formated = DateFormat.yMd();

enum Catagory { food, travle, leisure, work }

const catagoryIcon = {
  Catagory.food: Icons.lunch_dining,
  Catagory.travle: Icons.flight_takeoff,
  Catagory.leisure: Icons.movie,
  Catagory.work: Icons.work,
};

class Expance {
  Expance({
    required this.title,
    required this.amount,
    required this.date,
    required this.catagory,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Catagory catagory;

  String get formatedDate {
    return formated.format(date);
  }
}

class ExpencesBucket {
  const ExpencesBucket({
    required this.catagory,
    required this.expances,
  });

  ExpencesBucket.forCatogory(List<Expance> allExpances, this.catagory)
      : expances = allExpances
            .where((expence) => expence.catagory == catagory)
            .toList();

  final Catagory catagory;
  final List<Expance> expances;

  double get totalExpence {
    double sum = 0;
    for (final expance in expances) {
      sum += expance.amount;
    }
    return sum;
  }
}
