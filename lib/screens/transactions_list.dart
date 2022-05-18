import 'package:flutter/material.dart';
import 'package:mattbank/modelo/contact.dart';
import 'package:mattbank/modelo/transaction.dart';

class TransactionList extends StatelessWidget{

  final List<Transaction> transactions = [];

  TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        final Transaction transaction = transactions[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.monetization_on),
            title: Text(
              transaction.value.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              transaction.contact.accountNumber.toString(),
              style: const TextStyle(
                fontSize: 16
              ),
            ),
          ),
        );
      },
      itemCount: transactions.length,),
    );
  }}

