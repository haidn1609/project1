class PostInfoModel {
  int? id;
  int? count;
  String? name;
  String? description;
  String? slug;
  String? taxonomy;

  PostInfoModel(
      {this.id,
      this.count,
      this.name,
      this.description,
      this.slug,
      this.taxonomy});

  factory PostInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return PostInfoModel(
        id: jsonData['id'],
        count: jsonData['count'],
        name: jsonData['name'],
        description: jsonData['description'],
        slug: jsonData['slug'],
        taxonomy: (jsonData['taxonomy'].toString().contains('category') &&
                jsonData['id'] == 1)
            ? "categories"
            : jsonData['taxonomy']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['count'] = count;
    data['name'] = name;
    data['description'] = description;
    data['slug'] = slug;
    data['taxonomy'] = taxonomy;
    return data;
  }

  @override
  String toString() {
    return "$name";
  }
}
