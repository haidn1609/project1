import 'dart:async';

import 'package:acs_project_example/Model/postInfoModel.dart';
import 'package:acs_project_example/model/postModel.dart';
import 'package:acs_project_example/request_api/postRequestApi.dart';
import 'package:flutter/foundation.dart';

class DataPostProvider extends ChangeNotifier {
  List<PostInfoModel> get listCategory => _listCategory;
  List<PostInfoModel> _listCategory = [];

  List<PostInfoModel> get listLocation => _listLocation;
  List<PostInfoModel> _listLocation = [];

  List<PostInfoModel> get listCareer => _listCareer;
  List<PostInfoModel> _listCareer = [];

  List<PostInfoModel> get listWorkingType => _listWorkingType;
  List<PostInfoModel> _listWorkingType = [];

  List<PostInfoModel> get listCompany => _listCompany;
  List<PostInfoModel> _listCompany = [];

  List<PostInfoModel> get listSalary => _listSalary;
  List<PostInfoModel> _listSalary = [];

  List<PostModel> get listPost => _listPost;
  final List<PostModel> _listPost = [];

  bool get isLoadingData => _isLoadingData;
  bool _isLoadingData = false;

  int get totalPost => _totalPost;
  int _totalPost = 0;

  int get totalPage => (totalPost / 10).ceil();

  setTotalPost(List<PostInfoModel> listPostInfoModel, String slug) {
    _totalPost = listPostInfoModel
        .where(
          (element) => element.slug!.contains(slug),
        )
        .elementAt(0)
        .count!
        .toInt();
    notifyListeners();
  }

  Future loadCategory(int page) async {
    await getPostInfo(subApiCategory, page)
        .then((value) => _listCategory.addAll(value));
    notifyListeners();
  }

  Future loadLocation(int page) async {
    await getPostInfo(subApiLocation, page)
        .then((value) => _listLocation.addAll(value));
    notifyListeners();
  }

  Future loadCareer(int page) async {
    await getPostInfo(subApiCareer, page)
        .then((value) => _listCareer.addAll(value));
    notifyListeners();
  }

  Future loadWorkingType(int page) async {
    await getPostInfo(subApiWorkingType, page)
        .then((value) => _listWorkingType.addAll(value));
    notifyListeners();
  }

  Future loadCompany(int page) async {
    await getPostInfo(subApiCompany, page)
        .then((value) => _listCompany.addAll(value));
    notifyListeners();
  }

  Future loadSalary(int page) async {
    await getPostInfo(subApiSalary, page)
        .then((value) => _listSalary.addAll(value));
    notifyListeners();
  }

  Future loadPost(String? subRequest, int page) async {
    await getApiPost(
            subRequest: subRequest,
            page: page,
            listCareer: listCareer,
            listCategory: listCategory,
            listCompany: listCompany,
            listLocation: listLocation,
            listSalary: listSalary,
            listWorkingType: listWorkingType)
        .then(
      (value) => _listPost.addAll(value),
    );
    notifyListeners();
  }

  List<PostModel> getPostByWorkingType(int? idWorkingType) {
    return listPost
        .where((post) => post.workingType!
            .where((workingType) => workingType.id == idWorkingType)
            .isNotEmpty)
        .toList();
  }

  clearPost() {
    _listCategory.clear();
    _listCareer.clear();
    _listLocation.clear();
    _listCompany.clear();
    _listWorkingType.clear();
    _listSalary.clear();
    _listPost.clear();
    notifyListeners();
  }

  setLoading(bool value) {
    _isLoadingData = value;
    notifyListeners();
  }
}
