class Contact {
  final int id;
  final String name;
  final String email;
  final String message;
  final DateTime createdAt;

  Contact({
    required this.id,
    required this.name,
    required this.email,
    required this.message,
    required this.createdAt,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      message: json['message'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
