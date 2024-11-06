import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    //  when having a list with unknown length its not ideal to use column
    // the ListView.builder constructor tells flutter to only build/create the items only when they are visible

    return ListView.builder(
        //the Dismissible widget allows the data inside of it to be removed, but it won't delete it from the list by its own
        // so it just gives a swiping effect, so we should add the onDismissed parameter
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(.75),
              margin: Theme.of(context).cardTheme.margin,
              // we can set the margin manually but if we change the original one this won't affect this one and it won't look good
            ),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            key: ValueKey(expenses[index]),
            child: ExpensesItem(expenses[index])));
  }
}
