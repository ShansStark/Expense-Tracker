import 'package:expenseapp/Models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(children: [
          Text(expense.title,
              style: GoogleFonts.gabriela(
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 22))),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                '₹ ${expense.amounts.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    expense.formattedDate,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
