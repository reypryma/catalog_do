class User {
  final int? id;
  final String title;
  final String? subtitle;
  final String? image;
  final String? brief;
  final DateTime? dob;
  final String? phone;
  final String? location;
  final String profession;

  User({
    this.id,
    required this.title,
    this.subtitle = "",
    this.image = "",
    this.brief = "",
    this.phone = "",
    this.location = "",
    this.dob,
    this.profession = "",
  });
}