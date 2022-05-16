import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../modelo/contact.dart';

Future<Database> createDatabase() async {
  final dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'mattbank.db');

  final db = await openDatabase(path, onCreate: (db, version) {
    db.execute('CREATE TABLE contacts('
        'id INTEGER PRIMARY KEY, '
        'name TEXT, '
        'account_number INTEGER)');
  }, version: 1);

  return db;
}

Future<int> saveAsync(Contact contact) async {
  final db = await createDatabase();
  final Map<String, dynamic> contactMap = {};
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.accountNumber;
  return await db.insert('contacts', contactMap);
}

Future<List<Contact>?> findAllAsync() async {
  var db = await createDatabase();
  var maps = await db.query('contacts');
  final List<Contact>? contacts = [];

  for (Map<String, dynamic> map in maps) {
    final Contact contact = Contact(
      map['id'],
      map['name'],
      map['account_number'],
    );
    contacts!.add(contact);
  }
  return contacts;
}
