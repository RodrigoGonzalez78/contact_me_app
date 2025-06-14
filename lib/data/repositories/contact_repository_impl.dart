import '../../domain/entities/contact.dart';
import '../../domain/repositories/contact_repository.dart';
import '../../core/network/api_service.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ApiService apiService;

  ContactRepositoryImpl(this.apiService);

  @override
  Future<List<Contact>> getContacts(int page, int limit) {
    return apiService.fetchContacts(page, limit);
  }

  @override
  Future<Contact> getContactById(int id) {
    return apiService.fetchContactById(id);
  }
}
