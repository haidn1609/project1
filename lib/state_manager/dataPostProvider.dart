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
  List<PostModel> _listPost = [];

  bool get isLoadingData => _isLoadingData;
  bool _isLoadingData = false;

  Future loadCategory() async {
    await getCategory().then((value) => _listCategory = value);
    notifyListeners();
  }

  Future loadLocation() async {
    await getLocation().then((value) => _listLocation = value);
    notifyListeners();
  }

  Future loadCareer() async {
    await getCareer().then((value) => _listCareer = value);
    notifyListeners();
  }

  Future loadWorkingType() async {
    await getWorkingType().then((value) => _listWorkingType = value);
    notifyListeners();
  }

  Future loadCompany() async {
    await getCompany().then((value) => _listCompany = value);
    notifyListeners();
  }

  Future loadSalary() async {
    await getSalary().then((value) => _listSalary = value);
    notifyListeners();
  }

  Future loadPost(int? idCategories) async {
    await getApiPostByCategories(
            idCategories: idCategories,
            listCareer: listCareer,
            listCategory: listCategory,
            listCompany: listCompany,
            listLocation: listLocation,
            listSalary: listSalary,
            listWorkingType: listWorkingType)
        .then((value) => _listPost.addAll(value));
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
    _listPost.clear();
    notifyListeners();
  }

  setLoading(bool value) {
    _isLoadingData = value;
    notifyListeners();
  }
}
