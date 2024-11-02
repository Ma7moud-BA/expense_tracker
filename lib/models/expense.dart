import "package:uuid/uuid.dart";

final uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required,
      required this.date,
      required this.category})
      : id = uuid.v4();
  // a blue print for the expense model
  // use flutter pub add uuid
  // the : after the constructor will initialize a value when ever the constructor is called
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}

//  why not using String for category? - to prevent the typo errors when adding an unwanted category
//  So creating an enum will make it more optimal