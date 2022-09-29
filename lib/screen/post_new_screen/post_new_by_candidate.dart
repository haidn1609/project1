import 'dart:async';

import 'package:acs_project_example/mock_data.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';

import '../../value/colors.dart';

class PostNewCandidate extends StatefulWidget {
  const PostNewCandidate({Key? key}) : super(key: key);

  @override
  State<PostNewCandidate> createState() => _PostNewCandidateState();
}

class _PostNewCandidateState extends State<PostNewCandidate>
    with TickerProviderStateMixin {
  TextEditingController nameEdit = TextEditingController();
  TextEditingController dateEdit = TextEditingController();
  TextEditingController phoneEdit = TextEditingController();
  TextEditingController emailEdit = TextEditingController();
  TextEditingController skillEdit = TextEditingController();
  TextEditingController applyPositionEdit = TextEditingController();
  TextEditingController expEdit = TextEditingController();
  List<String> locationWorkingSelect = [];
  List<String> listLanguageSelect = [];

  Future _pickDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1975),
        lastDate: DateTime(2050));
    if (picked != null) {
      setState(() {
        dateEdit.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        "images/icon_close_post.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Flexible(
                      child: Center(
                        child: Text(
                          postTitleText,
                          style: TextStyle(
                              color: colorTextBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: widths * 0.90,
                          margin: const EdgeInsets.only(top: 40, bottom: 10),
                          child: TextField(
                            controller: nameEdit,
                            decoration: InputDecoration(
                              labelText: nameHideText,
                              labelStyle: TextStyle(
                                  color: labelTextColor, fontSize: 14),
                              filled: true,
                              fillColor: Colors.white.withOpacity(1),
                              focusColor: Colors.white.withOpacity(1),
                              hoverColor: Colors.white.withOpacity(1),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                            ),
                            showCursor: false,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: widths * 0.90,
                                height: 60,
                                child: TextField(
                                  readOnly: true,
                                  controller: dateEdit,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 12, right: 40),
                                    labelText: dateHideText,
                                    labelStyle: TextStyle(
                                        color: labelTextColor, fontSize: 14),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(1),
                                    focusColor: Colors.white.withOpacity(1),
                                    hoverColor: Colors.white.withOpacity(1),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          width: 2,
                                          color: Colors.grey,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          width: 2,
                                          color: Colors.grey,
                                        )),
                                  ),
                                  showCursor: false,
                                ),
                              ),
                              Positioned(
                                top: 12,
                                right: 15,
                                child: InkWell(
                                  onTap: () => _pickDate(),
                                  child: Image.asset(
                                    "images/icon_calendar.png",
                                    width: 20,
                                    height: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: widths * 0.90,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            controller: phoneEdit,
                            decoration: InputDecoration(
                              labelText: phoneHideText,
                              labelStyle: TextStyle(
                                  color: labelTextColor, fontSize: 14),
                              filled: true,
                              fillColor: Colors.white.withOpacity(1),
                              focusColor: Colors.white.withOpacity(1),
                              hoverColor: Colors.white.withOpacity(1),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                            ),
                            showCursor: false,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: widths * 0.90,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: emailEdit,
                            decoration: InputDecoration(
                              labelText: emailHideText,
                              labelStyle: TextStyle(
                                  color: labelTextColor, fontSize: 14),
                              filled: true,
                              fillColor: Colors.white.withOpacity(1),
                              focusColor: Colors.white.withOpacity(1),
                              hoverColor: Colors.white.withOpacity(1),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                            ),
                            showCursor: false,
                          ),
                        ),
                        Container(
                          width: widths * 0.90,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: skillEdit,
                            decoration: InputDecoration(
                              labelText: skillHideText,
                              labelStyle: TextStyle(
                                  color: labelTextColor, fontSize: 14),
                              filled: true,
                              fillColor: Colors.white.withOpacity(1),
                              focusColor: Colors.white.withOpacity(1),
                              hoverColor: Colors.white.withOpacity(1),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                            ),
                            showCursor: false,
                          ),
                        ),
                        Container(
                          width: widths * 0.9,
                          height: 50,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: backgroudWhiteItem,
                              borderRadius: BorderRadius.circular(30)),
                          child: DropDownMultiSelect(
                            //whenEmpty: languageHideText,
                            icon: Icon(Icons.arrow_drop_down,
                                color: backgroudOpacity1),
                            decoration: InputDecoration(
                              labelText: languageHideText,
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
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                            ),
                            onChanged: (List<String> x) {
                              setState(() {
                                listLanguageSelect = x;
                              });
                            },
                            options: listLanguage,
                            selectedValues: listLanguageSelect,
                          ),
                        ),
                        Container(
                          width: widths * 0.90,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: applyPositionEdit,
                            decoration: InputDecoration(
                              labelText: applyPositionHideText,
                              labelStyle: TextStyle(
                                  color: labelTextColor, fontSize: 14),
                              filled: true,
                              fillColor: Colors.white.withOpacity(1),
                              focusColor: Colors.white.withOpacity(1),
                              hoverColor: Colors.white.withOpacity(1),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                            ),
                            showCursor: false,
                          ),
                        ),
                        Container(
                          width: widths * 0.9,
                          height: 50,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: backgroudWhiteItem,
                              borderRadius: BorderRadius.circular(30)),
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
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                            ),
                            onChanged: (List<String> x) {
                              setState(() {
                                locationWorkingSelect = x;
                              });
                            },
                            options: listCountry,
                            selectedValues: locationWorkingSelect,
                          ),
                        ),
                        Container(
                          width: widths * 0.90,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: expEdit,
                            decoration: InputDecoration(
                              labelText: expHideText,
                              labelStyle: TextStyle(
                                  color: labelTextColor, fontSize: 14),
                              filled: true,
                              fillColor: Colors.white.withOpacity(1),
                              focusColor: Colors.white.withOpacity(1),
                              hoverColor: Colors.white.withOpacity(1),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  )),
                            ),
                            showCursor: false,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Container(
                width: double.infinity,
                height: 100,
                padding: const EdgeInsets.all(15),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: blackGradientColor)),
                    child: Center(
                      child: Text(
                        postBtText,
                        style: TextStyle(
                            color: colorTextWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
