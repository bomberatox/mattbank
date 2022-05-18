import 'package:flutter/material.dart';
import 'package:mattbank/screens/contacts_list.dart';
import 'package:mattbank/screens/transactions_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset('images/mattBankLogo.png'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _FeatureItem(
                    'Transfer',
                    Icons.monetization_on,
                    onClick: () => _showContactsList(),
                  ),
                  _FeatureItem(
                    'Transaction feed',
                    Icons.description,
                    onClick: () => _showTransactionsList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showContactsList() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ContactsList()));
  }

  void _showTransactionsList() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => TransactionList()));
  }
}

class _FeatureItem extends StatelessWidget {
  final String _name;
  final IconData _icon;
  final Function onClick;

  const _FeatureItem(this._name, this._icon, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  _icon,
                  color: Colors.white,
                  size: 32,
                ),
                Text(
                  _name,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
