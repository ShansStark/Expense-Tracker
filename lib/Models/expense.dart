import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.food_bank_outlined,
  Category.leisure: Icons.movie,
  Category.travel: Icons.travel_explore,
  Category.work: Icons.work_history_sharp,
};

class Expense {
  Expense({
    required this.title,
    required this.amounts,
    required this.date,
    required this.category,
  }) : id = uuid
            .v4(); // Creates a string ID from v4 from the uuid package in flutter.

  final String title;
  final double amounts;
  final String id;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
      : expenses = allExpense
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amounts;
    }

    return sum;
  }
}
