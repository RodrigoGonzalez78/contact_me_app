import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/contact_viewmodel.dart';
import 'contact_detail_screen.dart';

class ContactListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ContactViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Contactos')),
      body:
          vm.isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: vm.contacts.length,
                itemBuilder: (context, index) {
                  final contact = vm.contacts[index];
                  return ListTile(
                    title: Text(contact.name),
                    subtitle: Text(contact.email),
                    trailing: Text(
                      contact.createdAt.toIso8601String().substring(0, 10),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => ContactDetailScreen(contactId: contact.id),
                        ),
                      );
                    },
                  );
                },
              ),
    );
  }
}
