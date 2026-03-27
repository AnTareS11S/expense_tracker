import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        // Dismissible is a widget that allows the user to swipe to dismiss the widget, it's used to delete an expense from the list
        key: ValueKey(
          expenses[index],
        ), // ValueKey is used to identify the widget that should be dismissed, it takes a unique value (in this case, the expense object itself) to identify the widget
        background: Container(
          color: Theme.of(context).colorScheme.error.withValues(
            alpha: 0.75,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(
            expenses[index],
          ); // call the onRemoveExpense function passed from the parent widget (Expenses) to remove the expense from the list
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
