import "package:flutter/material.dart";
import "package:uuid/uuid.dart";
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

final uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

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

  // getter : a property that dynamically derived based on other class properties

  get formattedDate {
    // use "flutter pub add intl" to download the package
    return formatter.format(date);
  }
}

//  why not using String for category? - to prevent the typo errors when adding an unwanted category
//  So creating an enum will make it more optimal