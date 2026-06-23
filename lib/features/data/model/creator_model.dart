class CreatorModel {
  final int id;
  final String name;
  final String category;
  final int followers;
  final double rating;
  final String image;

  CreatorModel({
    required this.id,
    required this.name,
    required this.category,
    required this.followers,
    required this.rating,
    required this.image,
  });

  factory CreatorModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return CreatorModel(
      id: json['id'] ?? 0,
      name: json['name'] ??
          '${json['firstName'] ?? ''} ${json['lastName'] ?? ''}',
      category: json['category'] ?? 'Tech',
      followers: json['followers'] ?? 10000,
      rating: (json['rating'] ?? 4.5).toDouble(),
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'followers': followers,
      'rating': rating,
      'image': image,
    };
  }
}