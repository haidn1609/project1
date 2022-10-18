import 'dart:async';
import 'dart:convert';

import 'package:acs_project_example/Model/postInfoModel.dart';
import 'package:acs_project_example/model/postModel.dart';
import 'package:http/http.dart' as http;

String baseApi = "https://nganhangnhanluc.com/wp-json/wp/v2";
String subApiCareer = "nganh_nghe";
String subApiLocation = "khu_vuc";
String subApiCategory = "categories";
String subApiWorkingType = "hinh_thuc_lam_viec";
String subApiCompany = "cong_ty";
String subApiSalary = "muc_luong";
String subPostTag = "tags";

Future<List<PostInfoModel>> getCategory() async {
  List<PostInfoModel> listCategory = [];
  try {
    final response = await http.get(Uri.parse("$baseApi/$subApiCategory"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      for (var data in jsonData) {
        listCategory.add(PostInfoModel.fromJson(data));
      }
    }
    // else {
    //   print(
    //       "$baseApi/$subApiCategory ==> ${response.statusCode} :get du lieu category thất bại");
    // }
  } catch (err) {
    //print("$baseApi/$subApiCategory ==> ${err.toString()}");
  }
  return listCategory;
}

Future<List<PostInfoModel>> getLocation() async {
  List<PostInfoModel> listLocation = [];
  try {
    final response = await http.get(Uri.parse("$baseApi/$subApiLocation"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      for (var data in jsonData) {
        listLocation.add(PostInfoModel.fromJson(data));
      }
    }
    // else {
    //   print(
    //       "$baseApi/$subApiLocation ==> ${response.statusCode} :get du lieu location thất bại");
    // }
  } catch (err) {
    //print("$baseApi/$subApiLocation ==> ${err.toString()}");
  }
  return listLocation;
}

Future<List<PostInfoModel>> getCareer() async {
  List<PostInfoModel> listCareer = [];
  try {
    final response = await http.get(Uri.parse("$baseApi/$subApiCareer"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      for (var data in jsonData) {
        listCareer.add(PostInfoModel.fromJson(data));
      }
    }
    // else {
    //   print(
    //       "$baseApi/$subApiCareer ==> ${response.statusCode} :get du lieu career thất bại");
    // }
  } catch (err) {
    //print("$baseApi/$subApiCareer ==> ${err.toString()}");
  }
  return listCareer;
}

Future<List<PostInfoModel>> getWorkingType() async {
  List<PostInfoModel> listWorkingType = [];
  try {
    final response = await http.get(Uri.parse("$baseApi/$subApiWorkingType"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      for (var data in jsonData) {
        listWorkingType.add(PostInfoModel.fromJson(data));
      }
    }
    // else {
    //   print(
    //       "$baseApi/$subApiWorkingType ==> ${response.statusCode} :get du lieu working type thất bại");
    // }
  } catch (err) {
    //print("$baseApi/$subApiWorkingType ==> ${err.toString()}");
  }
  return listWorkingType;
}

Future<List<PostInfoModel>> getCompany() async {
  List<PostInfoModel> listCompany = [];
  try {
    final response = await http.get(Uri.parse("$baseApi/$subApiCompany"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      for (var data in jsonData) {
        listCompany.add(PostInfoModel.fromJson(data));
      }
    }
    // else {
    //   print(
    //       "$baseApi/$subApiCompany ==> ${response.statusCode} :get du lieu company thất bại");
    // }
  } catch (err) {
    //print("$baseApi/$subApiCompany ==> ${err.toString()}");
  }
  return listCompany;
}

Future<List<PostInfoModel>> getSalary() async {
  List<PostInfoModel> listSalary = [];
  try {
    final response = await http.get(Uri.parse("$baseApi/$subApiSalary"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      for (var data in jsonData) {
        listSalary.add(PostInfoModel.fromJson(data));
      }
    }
    // else {
    //   print(
    //       "$baseApi/$subApiSalary ==> ${response.statusCode} :get du lieu salary thất bại");
    // }
  } catch (err) {
    //print("$baseApi/$subApiSalary ==> ${err.toString()}");
  }
  return listSalary;
}

Future<List<PostModel>> getApiPostByCategories(
    {int? idSubRequest,
    int? page,
    String? subRequest,
    List<PostInfoModel>? listCategory,
    List<PostInfoModel>? listLocation,
    List<PostInfoModel>? listCareer,
    List<PostInfoModel>? listWorkingType,
    List<PostInfoModel>? listCompany,
    List<PostInfoModel>? listSalary}) async {
  List<PostModel> listPost = [];
  try {
    print("stat get api: $baseApi/posts?$subRequest=$idSubRequest&page=$page");
    final response = await http
        .get(Uri.parse("$baseApi/posts?$subRequest=$idSubRequest&page=$page"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      Map<String, dynamic> postInfo = <String, dynamic>{};
      for (var i = 0; i < [...jsonData].length; i++) {
        postInfo['categories'] = listCategory
            ?.where((element1) => [...jsonData[i]['categories']]
                .where((element2) => element2 == element1.id)
                .isNotEmpty)
            .map((PostInfoModel e) => e.toJson())
            .toList();
        postInfo['location'] = listLocation
            ?.where((element1) => [...jsonData[i]['khu_vuc']]
                .where((element2) => element2 == element1.id)
                .isNotEmpty)
            .map((e) => e.toJson())
            .toList();
        postInfo['career'] = listCareer
            ?.where((element1) => [...jsonData[i]['nganh_nghe']]
                .where((element2) => element2 == element1.id)
                .isNotEmpty)
            .map((e) => e.toJson())
            .toList();
        postInfo['workingType'] = listWorkingType
            ?.where((element1) => [...jsonData[i]['hinh_thuc_lam_viec']]
                .where((element2) => element2 == element1.id)
                .isNotEmpty)
            .map((e) => e.toJson())
            .toList();
        postInfo['company'] = listCompany
            ?.where((element1) => [...jsonData[i]['cong_ty']]
                .where((element2) => element2 == element1.id)
                .isNotEmpty)
            .map((e) => e.toJson())
            .toList();
        postInfo['salary'] = listSalary
            ?.where((element1) => [...jsonData[i]['muc_luong']]
                .where((element2) => element2 == element1.id)
                .isNotEmpty)
            .map((e) => e.toJson())
            .toList();
        postInfo['thumbnailUrl'] =
            jsonData[i]['yoast_head_json']['og_image'][0]['url'];
        listPost.add(PostModel.fromJson(jsonData[i], postInfo));
      }
      print(
          "get du lieu từ $baseApi/posts?$subRequest=$idSubRequest&page=$page thanh cong được ${listPost.length} item");
    } else {
      print(
          "$baseApi/posts?$subRequest=$idSubRequest&page=$page ==> ${response.statusCode} :get du lieu post thất bại");
    }
  } catch (err) {
    print(
        "$baseApi/posts?$subRequest=$idSubRequest&page=$page ==> ${err.toString()}");
  }
  return listPost;
}
