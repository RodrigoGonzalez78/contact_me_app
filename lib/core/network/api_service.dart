import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/contact.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8080';

  Future<List<Contact>> fetchContacts(int page, int limit) async {
    final response = await http.get(
      Uri.parse('$baseUrl/contacts?page=$page&limit=$limit'),
    );

    if (response.statusCode == 200) {
      final List jsonData = json.decode(response.body);
      return jsonData.map((e) => Contact.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener contactos');
    }
  }

  Future<Contact> fetchContactById(int id) async {
    final contacts = await fetchContacts(
      1,
      1000,
    ); // workaround para simular detalle
    return contacts.firstWhere((c) => c.id == id);
  }
}
