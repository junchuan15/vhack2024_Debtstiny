import 'dart:math';

import 'package:debtstiny/Pages/navpages/budget/daily_component.dart';
import 'package:debtstiny/Pages/navpages/budget/expenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BudgetDaily extends StatefulWidget {
  final double budget;

  const BudgetDaily({
    Key? key,
    required this.budget,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return BudgetDailyPage();
  }

}

class BudgetDailyPage extends State<BudgetDaily>{
  DateTime? selectedDate;
  late List<Expense> expenses;
  late List<List<Expense>> groupedExpenses = [];

  @override
  void initState() {
    Expense e1 = Expense(category: ExpenseCategory.Food, description: 'Lunch', amount: 20, date: DateTime.parse('2024-03-17 10:30:00'));
    Expense e2 = Expense(category: ExpenseCategory.Transportation, description: 'Grab', amount: 15, date: DateTime.parse('2024-03-20 10:30:00'));
    Expense e3 = Expense(category: ExpenseCategory.Utilities, description: 'Electric', amount: 60, date: DateTime.parse('2024-03-17 10:30:00'));
    Expense e4 = Expense(category: ExpenseCategory.Food, description: 'Dinner', amount: 24, date: DateTime.parse('2024-02-17 10:30:00'));
    Expense e5 = Expense(category: ExpenseCategory.Others, description: 'Clothes', amount: 100, date: DateTime.parse('2024-02-18 10:30:00'));
    expenses = [e1, e2, e3, e4, e5];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double budget = widget.budget;
    double totalExpenses = getTotalExpenses();
    double balance = budget - totalExpenses;
    // Sort expenses by date
    expenses.sort((a, b) => b.date.compareTo(a.date));
    // Function to check if two dates are on the same day
    bool isSameDay(DateTime date1, DateTime date2) {
      return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
    }
    // Group expenses by date
    groupedExpenses = [];
    DateTime? tempDate;
    List<Expense> tempGroup = [];
    for (Expense expense in expenses) {
      if(expense.date.year != DateTime.now().year || expense.date.month != DateTime.now().month) {
        continue;
      }
      if (tempDate == null || !isSameDay(expense.date, tempDate)) {
        // Start a new group
        if (tempGroup.isNotEmpty) {
          groupedExpenses.add(List.from(tempGroup)); // Add the previous group to groupedExpenses
          tempGroup.clear(); // Clear tempGroup for a new group
        }
        tempDate = expense.date; // Update tempDate
      }
      tempGroup.add(expense); // Add expense to tempGroup
    }
    // Add the last group to groupedExpenses
    if (tempGroup.isNotEmpty) {
      groupedExpenses.add(List.from(tempGroup));
    }

    return Scaffold(
      body: Container(
        color: Color(0xFFF3FCF7),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text('Budget',
                        style: TextStyle(
                          fontFamily: 'PT Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          ),
                        ),
                        Text("RM${budget.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontFamily: 'PT Sans',
                            fontSize: 18,
                            color: Colors.green,
                          ),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('Expenses',
                          style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text("RM${totalExpenses.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontSize: 18,
                            color: Colors.red,
                          ),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('Balance',
                          style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text("RM${balance.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontSize: 18,
                            color: Colors.black,
                          ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.grey[400],
              width: double.infinity,
              height: 2,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: groupedExpenses.length,
                    itemBuilder: (context, index){
                      return DailyComponent(expenses: groupedExpenses[index]);
                    })
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          _showAddExpenseDialog(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,),
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  
  double getTotalExpenses(){
    double total = 0;
    for(List<Expense> expenses in groupedExpenses){
      for(Expense expense in expenses){
        total += expense.amount;
      }
    }
    return total;
  }

  void _showAddExpenseDialog(BuildContext context) {
    ExpenseCategory selectedCategory = ExpenseCategory.Food;
    DateTime? selectedDate; // Declare selectedDate variable
    final TextEditingController categoryController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Add Expense',
              style: TextStyle(
                fontFamily: ('PT Sans'),
              ),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (selectedDate != null) // Display selected date if not null
                    Text(
                      'Selected Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: ('PT Sans'),),
                    ),
                  ElevatedButton(
                    onPressed: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2025),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate; // Update selectedDate
                        });
                      }
                    },
                    child: Text('Select Date',
                    style: TextStyle(
                        fontFamily: ('PT Sans'),
                    ),),
                  ),
                  DropdownButtonFormField<ExpenseCategory>(
                    value: selectedCategory,
                    onChanged: (ExpenseCategory? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      }
                    },
                    items: ExpenseCategory.values.map((category) {
                      return DropdownMenuItem<ExpenseCategory>(
                        value: category,
                        child: Text(category.toString().split('.').last,
                        style: TextStyle(
                          fontFamily: ('PT Sans'),),),
                      );
                    }).toList(),
                    decoration: InputDecoration(labelText: 'Category',),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Description'),
                    maxLines: null,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel',
                  style: TextStyle(fontFamily: ('PT Sans'),),),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic to save the expense
                    // For example:
                    // var date = selectedDate;
                    // var category = selectedCategory;
                    // var amount = double.parse(amountController.text);
                    // var description = descriptionController.text;
                    // Then save this data to your expense list or database
                    Navigator.of(context).pop();
                  },
                  child: Text('Save',
                  style: TextStyle(fontFamily: ('PT Sans'),),),
                ),
              ],
            );
          },
        );
      },
    );
  }
}