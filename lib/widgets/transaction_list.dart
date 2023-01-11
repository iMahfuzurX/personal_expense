import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function(int) delTransaction;
  const TransactionList({
    super.key,
    required this.transactionList,
    required this.delTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: (transactionList.isEmpty)
          ? Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'No Transaction added yet',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '\$${transactionList[index].amount.toStringAsFixed(2)}',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Text(
                              transactionList[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 18),
                              // style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Text(
                              DateFormat.yMMMd()
                                  .format(transactionList[index].date),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => delTransaction(index),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactionList.length,
            ),
    );
  }
}
