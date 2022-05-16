import 'package:flutter/material.dart';
import 'package:mattbank/modelo/contact.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo contato"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Nome completo",
              ),
              style: const TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: _accountNumberController,
                decoration: const InputDecoration(
                  labelText: "Número da conta",
                ),
                style: const TextStyle(fontSize: 16),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () {
                        final String name = _nameController.text;
                        final int? accountNumber =
                            int.tryParse(_accountNumberController.text);
                        final Contact newContact =
                            Contact(0, name, accountNumber!);
                        Navigator.pop(context, newContact);
                      },
                      child: const Text("Salvar"))),
            )
          ],
        ),
      ),
    );
  }
}
