import 'package:flutter/material.dart';
import 'package:mattbank/screens/contactForm.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(
                'Nome',
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                'Conta',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then(
                (newContact) => debugPrint(newContact.toString()),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
