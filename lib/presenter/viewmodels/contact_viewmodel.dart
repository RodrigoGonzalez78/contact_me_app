import 'package:flutter/material.dart';
import '../../domain/entities/contact.dart';
import '../../data/repositories/contact_repository_impl.dart';
import '../../core/network/api_service.dart';

class ContactViewModel extends ChangeNotifier {
  final ContactRepositoryImpl _repository = ContactRepositoryImpl(ApiService());

  List<Contact> _contacts = [];
  bool _isLoading = false;

  List<Contact> get contacts => _contacts;
  bool get isLoading => _isLoading;

  Future<void> loadContacts({int page = 1, int limit = 20}) async {
    _isLoading = true;
    notifyListeners();
    _contacts = await _repository.getContacts(page, limit);
    _isLoading = false;
    notifyListeners();
  }

  Future<Contact> getContactById(int id) {
    return _repository.getContactById(id);
  }
}
