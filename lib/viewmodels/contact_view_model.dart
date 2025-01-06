import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/constants/api_constants.dart';
import 'package:flutter_application_test/models/contact_model.dart';
import 'package:flutter_application_test/repositories/contact_repository.dart';

class ContactViewModel extends ChangeNotifier {
  final ContactRepository _repository;
  List<Contact> contacts = [];
  bool isLoading = false;
  int currentPage = 0;

  ContactViewModel(this._repository) {
    loadInitialContacts();
  }

  Future<void> loadInitialContacts() async {
    if (contacts.isNotEmpty) return;

    isLoading = true;
    notifyListeners();

    try {
      final batches = await Future.wait([
        _repository.getContacts(0, ApiConstants.initialLoadCount),
      ]);

      contacts = batches.expand((batch) => batch).toList();
      currentPage = 2;
    } catch (e) {
      debugPrint('Error loading contacts: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadMoreContacts() async {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    try {
      final newContacts = await _repository.getContacts(
          currentPage, ApiConstants.resultsPerPage);
      contacts.addAll(newContacts);
      currentPage++;
    } catch (e) {
      debugPrint('Error loading more contacts: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
