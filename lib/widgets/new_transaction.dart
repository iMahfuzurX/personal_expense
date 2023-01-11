import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double) addTransaction;
  const NewTransaction({
    required this.addTransaction,
    super.key,
  });

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount == 0) {
      return;
    }
    widget.addTransaction(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              // onChanged: (val) => inputTitle = val,
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              // onChanged: (val) => inputAmount = val,
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: TextButton(
                onPressed: submitData,
                style: TextButton.styleFrom(
                    // padding: const EdgeInsets.all(10),
                    ),
                child: const Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
