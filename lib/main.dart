import 'package:flutter/material.dart';
import 'package:personal_expense/widgets/chart.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      // theme: theme.copyWith(
      //   colorScheme: theme.colorScheme.copyWith(secondary: Colors.amber),
      // ),
      theme: ThemeData(
        textTheme: const TextTheme(
          titleSmall: TextStyle(fontFamily: 'Quicksand'),
          titleMedium: TextStyle(fontFamily: 'Quantico'),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Quantico',
            fontSize: 20,
            // fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.purple,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
      ),

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.19,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Daily Groceries',
    //   amount: 16.23,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't3',
    //   title: 'More Groceries',
    //   amount: 16.2,
    //   date: DateTime.now(),
    // ),
  ];

  void _addTransaction(String title, double amount) {
    setState(() {
      _userTransactions.add(Transaction(
        id: 'id',
        title: title,
        amount: amount,
        date: DateTime.now(),
      ));
    });
  }

  void _delTransaction(int index) {
    setState(() {
      _userTransactions.removeAt(index);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(addTransaction: _addTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personal Expenses",
        ),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                color: Colors.orange,
                child: Text("CHART"),
              ),
            ), // chart
            Chart(),
            TransactionList(
              transactionList: _userTransactions,
              delTransaction: _delTransaction,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
