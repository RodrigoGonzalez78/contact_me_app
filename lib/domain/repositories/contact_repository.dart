import '../entities/contact.dart';

abstract class ContactRepository {
  Future<List<Contact>> getContacts(int page, int limit);
  Future<Contact> getContactById(int id);
}
