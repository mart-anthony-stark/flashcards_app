class CollectionModel {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;

  CollectionModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdAt});

  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    return CollectionModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
