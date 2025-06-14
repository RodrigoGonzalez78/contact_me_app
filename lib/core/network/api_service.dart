import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/contact.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000';

  Future<List<Contact>> fetchContacts(int page, int limit) async {
    final response = await http.get(
      Uri.parse('$baseUrl/contacts?page=$page&limit=$limit'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);

      if (jsonMap['contacts'] == null) {
        return [];
      }
      final List jsonData = jsonMap['contacts'] as List;
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
