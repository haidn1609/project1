import 'package:acs_project_example/Model/postInfoModel.dart';
import 'package:acs_project_example/state_manager/dataPostProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';

import '../../request_api/postRequestApi.dart';
import '../../value/colors.dart';
import '../../value/strings.dart';
import '../show_content_screen/ShowListPost.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> locationWorkingSelect = [];
  List<String> fieldWorkingSelect = [];
  List<String> salarySelect = [];
  TextEditingController salaryControler = TextEditingController();
  bool isMale = true;

  String getSubRequest(List<String> toLists, List<PostInfoModel> fromList) {
    String subRequest = "";
    List<PostInfoModel> lists = toLists
        .map((e1) => fromList.firstWhere((e2) => e2.name == e1))
        .toList();
    if (lists.isNotEmpty) {
      for (var e in lists) {
        subRequest += "${e.taxonomy}=${e.id} ";
      }
    }
    return subRequest;
  }

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return Consumer<DataPostProvider>(
      builder: (context, value, child) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: backgroudWhiteItem,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade800.withOpacity(0.25),
                        blurRadius: 7,
                        spreadRadius: 4,
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "images/icon_close_post.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Center(
                          child: Text(
                            filterTitleText,
                            style: TextStyle(
                              color: colorTextBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: widths * 0.85,
                          height: 50,
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          decoration: BoxDecoration(
                            color: backgroudWhiteItem,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropDownMultiSelect(
                            icon: Icon(Icons.arrow_drop_down,
                                color: backgroudOpacity1),
                            decoration: InputDecoration(
                              labelText: locationWorkingHideText,
                              labelStyle: TextStyle(
                                  color: labelTextColor, fontSize: 14),
                              suffixIcon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.black, size: 40),
                              focusColor: Colors.white.withOpacity(0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            onChanged: (List<String> x) {
                              setState(() {
                                locationWorkingSelect = x;
                              });
                            },
                            options: value.listLocation
                                .map((e) => e.toString())
                                .toList(),
                            selectedValues: locationWorkingSelect,
                          ),
                        ),
                        Container(
                          width: widths * 0.85,
                          height: 50,
                          margin: const EdgeInsets.only(top: 15, bottom: 10),
                          decoration: BoxDecoration(
                            color: backgroudWhiteItem,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropDownMultiSelect(
                            icon: Icon(Icons.arrow_drop_down,
                                color: backgroudOpacity1),
                            decoration: InputDecoration(
                              labelText: fieldWorkingHideText,
                              labelStyle: TextStyle(
                                  color: labelTextColor, fontSize: 14),
                              suffixIcon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.black, size: 40),
                              focusColor: Colors.white.withOpacity(0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            onChanged: (List<String> x) {
                              setState(() {
                                fieldWorkingSelect = x;
                              });
                            },
                            options: value.listCareer
                                .map((e) => e.toString())
                                .toList(),
                            selectedValues: fieldWorkingSelect,
                          ),
                        ),
                        Container(
                          width: widths * 0.85,
                          height: 50,
                          margin: const EdgeInsets.only(top: 15, bottom: 10),
                          decoration: BoxDecoration(
                            color: backgroudWhiteItem,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropDownMultiSelect(
                            icon: Icon(Icons.arrow_drop_down,
                                color: backgroudOpacity1),
                            decoration: InputDecoration(
                              labelText: salaryHideText,
                              labelStyle: TextStyle(
                                  color: labelTextColor, fontSize: 14),
                              suffixIcon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.black, size: 40),
                              focusColor: Colors.white.withOpacity(0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            onChanged: (List<String> x) {
                              setState(() {
                                salarySelect = x;
                              });
                            },
                            options: value.listSalary
                                .map((e) => e.toString())
                                .toList(),
                            selectedValues: salarySelect,
                          ),
                        ),
                        Container(
                          width: widths * 0.87,
                          height: 60,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                sexText,
                                style: TextStyle(
                                  color: colorTextBlack,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      margin: const EdgeInsets.only(
                                        right: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: isMale
                                            ? LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomCenter,
                                                colors: blackGradientColor,
                                              )
                                            : null,
                                      ),
                                      child: Checkbox(
                                        value: isMale,
                                        onChanged: (value) {
                                          setState(() {
                                            isMale = !isMale;
                                          });
                                        },
                                        activeColor: Colors.transparent,
                                      ),
                                    ),
                                    const Text(maleText),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      margin: const EdgeInsets.only(
                                        right: 10,
                                        left: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: !isMale
                                            ? LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomCenter,
                                                colors: blackGradientColor,
                                              )
                                            : null,
                                      ),
                                      child: Checkbox(
                                        value: !isMale,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              isMale = !isMale;
                                            },
                                          );
                                        },
                                        activeColor: Colors.transparent,
                                      ),
                                    ),
                                    const Text(femaleText),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 80,
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () async {
                      String subRequest = '';
                      subRequest = (getSubRequest(
                                  locationWorkingSelect, value.listLocation) +
                              getSubRequest(
                                  fieldWorkingSelect, value.listCareer) +
                              getSubRequest(salarySelect, value.listSalary))
                          .trim()
                          .replaceAll(" ", "&");
                      value.setLoading(true);
                      await getApiPost(
                              subRequest: "$subApiCategory=1&$subRequest",
                              page: 1,
                              listCareer: value.listCareer,
                              listCategory: value.listCategory,
                              listCompany: value.listCompany,
                              listLocation: value.listLocation,
                              listSalary: value.listSalary,
                              listWorkingType: value.listWorkingType)
                          .then(
                        (value) => Get.to(
                          ShowListPost(
                              listPost: value, title: "C??ng vi???c ph?? h???p"),
                          duration: const Duration(seconds: 1),
                          transition: Transition.upToDown,
                        ),
                      );
                      value.setLoading(false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: blackGradientColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          applyBtText,
                          style: TextStyle(
                            color: colorTextWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
