import 'package:contact_me_app/presenter/screens/contact_list_screen.dart';
import 'package:contact_me_app/presenter/viewmodels/contact_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactViewModel()..loadContacts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ContactListScreen(),
      ),
    );
  }
}
