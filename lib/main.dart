import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_test/viewmodels/contact_view_model.dart';
import 'package:flutter_application_test/repositories/contact_repository.dart';
import 'package:flutter_application_test/core/services/http_service.dart';
import 'package:flutter_application_test/views/contacts/contacts_list_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ContactViewModel(
        ContactRepository(HttpService()),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ContactsListView(),
    );
  }
}
