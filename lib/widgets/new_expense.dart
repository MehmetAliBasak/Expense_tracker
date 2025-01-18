import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewExpanse extends StatefulWidget {
  const NewExpanse({super.key});

  @override
  State<NewExpanse> createState() => _NewExpanseState();
}

class _NewExpanseState extends State<NewExpanse> {

 final _titleController = TextEditingController();
 final _amountController = TextEditingController();

 void _presentDatePicker() {
   final now = DateTime.now();
   final firstDate = DateTime(now.year -1, now.month,now.day);
   showDatePicker(context: context, firstDate: firstDate , lastDate: now);
 }

  @override
  void dispose() {
    _titleController;
    _amountController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: InputDecoration(
                    prefixText: "\$",
                    label: Text("Amount"),
                  ),
                ),
              ),
              SizedBox(width: 16,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("selected date"),
                    IconButton(onPressed: (){
                      _presentDatePicker();
                    }, icon: Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Text("category"),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Cancel")),
              ElevatedButton(onPressed: () {
                print(_titleController.text);
                print(_amountController.text);
              }, child: Text("Save Expense")),
            ],
          )
        ],
      ),
    );
  }
}
