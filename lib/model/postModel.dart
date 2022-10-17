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
      this.category,
      this.location,
      this.career,
      this.workingType,
      this.company,
      this.salary,
      this.thumbnailUrl});

  factory PostModel.fromJson(
      Map<String, dynamic> jsonData, Map<String, dynamic> postInfo) {
    return PostModel(
        id: jsonData['id'],
        date: DateTime.parse(jsonData['date']),
        date_gmt: DateTime.parse(jsonData['date_gmt']),
        modified: DateTime.parse(jsonData['modified']),
        modified_gmt: DateTime.parse(jsonData['modified_gmt']),
        status: jsonData['status'],
        type: jsonData['type'],
        description: jsonData['yoast_head_json']['og_description'],
        slug: jsonData['slug'],
        title: jsonData['yoast_head_json']['og_title'],
        category: (postInfo['categories'].length > 0 && postInfo['categories'] != null)
            ? List<PostInfoModel>.generate(postInfo['categories'].length, (index) => PostInfoModel.fromJson(postInfo['categories'][index]))
                .toList()
            : [],
        location: (postInfo['location'].length > 0 && postInfo['location'] != null)
            ? List<PostInfoModel>.generate(postInfo['location'].length, (index) => PostInfoModel.fromJson(postInfo['location'][index]))
                .toList()
            : [],
        career: (postInfo['career'].length > 0 && postInfo['career'] != null)
            ? List<PostInfoModel>.generate(postInfo['career'].length, (index) => PostInfoModel.fromJson(postInfo['career'][index]))
                .toList()
            : [],
        workingType:
            (postInfo['workingType'].length > 0 && postInfo['workingType'] != null)
                ? List<PostInfoModel>.generate(
                        postInfo['workingType'].length, (index) => PostInfoModel.fromJson(postInfo['workingType'][index]))
                    .toList()
                : [],
        company: (postInfo['company'].length > 0 && postInfo['company'] != null)
            ? List<PostInfoModel>.generate(postInfo['company'].length, (index) => PostInfoModel.fromJson(postInfo['company'][index])).toList()
            : [],
        salary: (postInfo['salary'].length > 0 && postInfo['salary'] != null) ? List<PostInfoModel>.generate(postInfo['salary'].length, (index) => PostInfoModel.fromJson(postInfo['salary'][index])).toList() : [],
        thumbnailUrl: postInfo['thumbnailUrl']);
  }

  @override
  String toString() {
    return "$id -- $title -- ${career!.join(',')} -- ${workingType!.join(',')}\n";
  }
}
