import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'flutter course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // to clear the previous snackbar notification when deleting more than 1 item at once
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                // this will bring back the removed expense exactly at its previous location
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
        content: const Text('Expense deleted'),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    // showModalBottomSheet and other similar functions are built in function by flutter to show some UI like a date picker or dialog
    showModalBottomSheet(
      isScrollControlled:
          true, // this will make the modal take full screen to prevent the keyboard from overlapping over the input fields
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: addExpense,
      ),
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          // whenever there is a column inside another column, flutter will have issues rendering it because it doesn't know how to size the inner column so we should use Expanded widget or other widgets
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
