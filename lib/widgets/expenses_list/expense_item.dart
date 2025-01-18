import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.title),
              SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${expense.amount.toStringAsFixed(2)}"),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      SizedBox(width: 8,),
                      Text("${expense.formattedDate}"),
                    ],
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
