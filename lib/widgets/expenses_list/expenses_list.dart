import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    //  when having a list with unknown length its not ideal to use column
    // the ListView.builder constructor tells flutter to only build/create the items only when they are visible

    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => ExpensesItem(expenses[index]));
  }
}
