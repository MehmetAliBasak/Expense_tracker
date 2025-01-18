import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_expense.dart';


class Expenses extends StatefulWidget {
  const Expenses({super.key, required this.title});

  final String title;

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  
  final List<Expense> _registereExpenses = [
    Expense(title: "Flutter Course", amount: 19.99, date: DateTime.now(), category: Category.work),
    Expense(title: "Cinema", amount: 15.69, date: DateTime.now(), category: Category.leisure),
  ];

  
  void _openAddExpenseOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => NewExpanse());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(onPressed:(){
            _openAddExpenseOverlay();
          }, icon: Icon(Icons.add,size: 30,))
        ],
        title: Text("Flutter Expense Tracker"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: ExpensesList(expenses: _registereExpenses))
          ],
        ),
      ),
    );
  }
}