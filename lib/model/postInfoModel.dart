class PostInfoModel {
  int? id;
  int? count;
  String? name;
  String? description;
  String? slug;
  String? taxonomy;
  String? link;
  String? links;

  PostInfoModel(
      {this.id,
      this.count,
      this.name,
      this.description,
      this.slug,
      this.taxonomy,
      this.link,
      this.links});

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
          : jsonData['taxonomy'],
      link: jsonData['link'],
      links: jsonData['_links']['wp:post_type'][0]['href'],
    );
  }

  @override
  String toString() {
    return "$name";
  }
}
