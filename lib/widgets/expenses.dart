import 'package:expenseapp/main.dart';
import 'package:expenseapp/widgets/Expenes_List/expenses_list.dart';
import 'package:expenseapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expenseapp/Models/expense.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expenseapp/widgets/Chart/chart.dart';
//import 'package:expenseapp/widgets/Chart/chart_bar.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amounts: 349,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'LEO Movie',
        amounts: 200,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
      ScaffoldMessenger.of(context)
          .clearSnackBars(); //Clear the existing info message  that have to be removed
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
        duration: const Duration(seconds: 5),
        content: const Text('Expense Deleted.'),
      ));
    });
  }

  void _openAddExpenseOption() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    Widget mainContent = const Center(
      child: Text(
        'No expenses found. Start Adding',
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Expense Tracker',
            style: GoogleFonts.sanchez(
                fontSize: 35, color: kDarkColorScheme.secondary),
          ),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOption,
                icon: const Icon(
                  Icons.add_circle_outlined,
                  color: Colors.white70,
                )),
          ]),
      body: width < 600
          ? Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Chart(expenses: _registeredExpenses),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: mainContent,
                )
              ],
            )
          : Row(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: Chart(expenses: _registeredExpenses)),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: mainContent,
                )
              ],
            ),
    );
  }
}
