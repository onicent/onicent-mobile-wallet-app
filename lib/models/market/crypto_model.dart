
class Crypto {
  final int userId;
  final int id;
  final String title;

  Crypto({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}