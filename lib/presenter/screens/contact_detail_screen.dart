import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/contact_viewmodel.dart';

class ContactDetailScreen extends StatelessWidget {
  final int contactId;

  const ContactDetailScreen({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ContactViewModel>(context, listen: false);

    return FutureBuilder(
      future: vm.getContactById(contactId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final contact = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: Text(contact.name)),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email: ${contact.email}", style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text("Fecha: ${contact.createdAt}"),
                SizedBox(height: 20),
                Text("Mensaje:", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(contact.message),
              ],
            ),
          ),
        );
      },
    );
  }
}
