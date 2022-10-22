import 'package:acs_project_example/Model/postInfoModel.dart';

class PostModel {
  int? id;
  DateTime? date;
  DateTime? date_gmt;
  DateTime? modified;
  DateTime? modified_gmt;
  String? status;
  String? type;
  String? slug;
  String? title;
  String? description;
  String? link;
  List<PostInfoModel>? category;
  List<PostInfoModel>? location;
  List<PostInfoModel>? career;
  List<PostInfoModel>? workingType;
  List<PostInfoModel>? company;
  List<PostInfoModel>? salary;
  String? thumbnailUrl;

  PostModel(
      {this.id,
      this.date,
      this.date_gmt,
      this.modified,
      this.modified_gmt,
      this.status,
      this.type,
      this.slug,
      this.title,
      this.description,
      this.link,
      this.category,
      this.location,
      this.career,
      this.workingType,
      this.company,
      this.salary,
      this.thumbnailUrl});

  factory PostModel.fromJson(
    Map<String, dynamic> jsonData,
    //Map<String, dynamic> postInfo,
    List<PostInfoModel> categorys,
    List<PostInfoModel> locations,
    List<PostInfoModel> careers,
    List<PostInfoModel> workingTypes,
    List<PostInfoModel> companys,
    List<PostInfoModel> salarys,
    String _thumbnailUrl,
  ) {
    return PostModel(
        id: jsonData['id'],
        date: DateTime.parse(jsonData['date']),
        date_gmt: DateTime.parse(jsonData['date_gmt']),
        modified: DateTime.parse(jsonData['modified']),
        modified_gmt: DateTime.parse(jsonData['modified_gmt']),
        status: jsonData['status'],
        type: jsonData['type'],
        description: jsonData['yoast_head_json']['og_description'],
        link: jsonData['link'],
        slug: jsonData['slug'],
        title: jsonData['yoast_head_json']['og_title'],
        category: categorys.isNotEmpty ? categorys : [],
        location: locations.isNotEmpty ? locations : [],
        career: careers.isNotEmpty ? careers : [],
        workingType: workingTypes.isNotEmpty ? workingTypes : [],
        company: companys.isNotEmpty ? companys : [],
        salary: salarys.isNotEmpty ? salarys : [],
        thumbnailUrl: _thumbnailUrl.replaceAll("demo.", ""));
  }

  @override
  String toString() {
    return "$id -- $title -- ${career!.join(',')} -- ${workingType!.join(',')} -- $link\n\n";
  }
}
