import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // whenever  using a TextEditingController we should dispose it when its not needed anymore to prevent it from living the memory
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      // the showDatePicker returns an instance of the picked date but wrapped in a value of type "Future"
      // its simply an object from the future that we don't have a value for it yet but will have
      // so to get the value we should call the .then method "its like the Async Promise functions in JS"
      // another way is to make the function async
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose;
    super.dispose();
  }

  // 1st method to handle and store the input filed values // just pass the _ textFiledValue function to the on Change function
  // var _enteredTitle = '';
  // void _textFieldValue(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            // onChanged: _textFieldValue,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              // the Textfield should be wrapped with Expanded widget because it takes as much horizontally space as possible and the Row widget doesn't restrict it
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Amount"), prefixText: '\$  '),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No date selected'
                        : formatter.format(_selectedDate!),
                  ),
                  IconButton(
                      onPressed: _showDatePicker,
                      icon: const Icon(
                        Icons.calendar_month,
                      ))
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  // the DropDownButton widget renders a button that will show a drop down when clicked, the items property wants a list of DropDownMenuItem values
                  // the DropdownMenuItem takes a widget
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          // this value parameter will be stored internally for every dropdown item in the list and it will be the same value on the onChanged function whenever the user selects on the drop down items

                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                  print(_selectedDate);
                },
                child: const Text("Save Expense"),
              ),
            ],
          )
        ],
      ),
    );
  }
}