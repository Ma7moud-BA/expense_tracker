import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            expense.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge, // this will inherit the titleLarge custom made theme in the MaterialApp widget
          ),
          const SizedBox(
            height: 4,
          ),
          Row(children: [
            Text('\$${expense.amount.toStringAsFixed(2)}'),
            const Spacer(), // Spacer widget is used in Column or Row and it will take all the available space between the other widgets
            Row(
              children: [
                Icon(categoryIcons[expense.category]),
                const SizedBox(width: 8),
                Text(expense.formattedDate)
              ],
            )
          ] //12.3433 => 12.34

              )
        ],
      ),
    ));
  }
}
