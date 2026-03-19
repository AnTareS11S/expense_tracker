import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose(); // always dispose
    super.dispose();
  }

  // Another option to do it
  //var _enteredTitle = '';

  //void _saveTitleInput(String inputValue) {
  // _enteredTitle = inputValue;
  //}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            //onChanged: _saveTitleInput,
            controller: _titleController,
            maxLength: 50,
            //keyboardType: TextInputType.text, // default option
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
