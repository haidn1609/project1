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

Future<List<PostInfoModel>> getPostInfo(String subApi) async {
  List<PostInfoModel> listInfo = [];
  try {
    final response = await http.get(Uri.parse("$baseApi/$subApi"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      for (var data in jsonData) {
        listInfo.add(PostInfoModel.fromJson(data));
      }
    } else {
      print(
          "$baseApi/$subApi ==> ${response.statusCode} :get du lieu category thất bại");
    }
  } catch (err) {
    print("$baseApi/$subApi ==> ${err.toString()}");
  }
  return listInfo;
}

Future<List<PostModel>> getApiPost(
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
      for (var i = 0; i < [...jsonData].length; i++) {
        List<PostInfoModel>? _listCategory = listCategory
            ?.where((element1) => [...jsonData[i]['categories']]
                .where((element2) => element2 == element1.id)
                .isNotEmpty)
            .toList();
        List<PostInfoModel>? _listLocation = listLocation
            ?.where((element1) => [...jsonData[i]['khu_vuc']]
                .where((element2) => element2 == element1.id)
                .isNotEmpty)
            .toList();
        List<PostInfoModel>? _listCareer = listCareer
            ?.where((element1) => [...jsonData[i]['nganh_nghe']]
                .where((element2) => element2 == element1.id)
                .isNotEmpty)
            .toList();
        List<PostInfoModel>? _listWorkingType = listWorkingType
            ?.where((element1) => [...jsonData[i]['hinh_thuc_lam_viec']]
                .where((element2) => element2 == element1.id)
                .isNotEmpty)
            .toList();
        List<PostInfoModel>? _listCompany = listCompany
            ?.where((element1) => [...jsonData[i]['cong_ty']]
                .where((element2) => element2 == element1.id)
                .isNotEmpty)
            .toList();
        List<PostInfoModel>? _listSalary = listSalary
            ?.where((element1) => [...jsonData[i]['muc_luong']]
                .where((element2) => element2 == element1.id)
                .isNotEmpty)
            .toList();
        String thumbnailUrl =
            jsonData[i]['yoast_head_json']['og_image'][0]['url'];
        listPost.add(PostModel.fromJson(
            jsonData[i],
            _listCategory!,
            _listLocation!,
            _listCareer!,
            _listWorkingType!,
            _listCompany!,
            _listSalary!,
            thumbnailUrl));
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
