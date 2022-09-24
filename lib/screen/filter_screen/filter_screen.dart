import 'package:acs_project_example/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';

import '../../value/colors.dart';
import '../../value/strings.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> locationWorkingSelect = [];
  List<String> fieldWorkingSelect = [];
  TextEditingController salaryControler = TextEditingController();
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: Colors.grey.shade800.withOpacity(0.25),
                blurRadius: 7,
                spreadRadius: 4,
              )
            ]),
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
                      filterTitleText,
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: widths * 0.85,
                      height: 50,
                      margin: const EdgeInsets.only(top: 40, bottom: 10),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(30)),
                      child: DropDownMultiSelect(
                        icon: Icon(Icons.arrow_drop_down,
                            color: backgroudOpacity1),
                        decoration: InputDecoration(
                          labelText: locationWorkingHideText,
                          labelStyle:
                              TextStyle(color: labelTextColor, fontSize: 14),
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
                      width: widths * 0.85,
                      height: 50,
                      margin: const EdgeInsets.only(top: 15, bottom: 10),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(30)),
                      child: DropDownMultiSelect(
                        icon: Icon(Icons.arrow_drop_down,
                            color: backgroudOpacity1),
                        decoration: InputDecoration(
                          labelText: fieldWorkingHideText,
                          labelStyle:
                              TextStyle(color: labelTextColor, fontSize: 14),
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
                            fieldWorkingSelect = x;
                          });
                        },
                        options: listFieldWorking,
                        selectedValues: fieldWorkingSelect,
                      ),
                    ),
                    Container(
                      width: widths * 0.85,
                      height: 50,
                      margin: const EdgeInsets.only(top: 15, bottom: 10),
                      child: TextField(
                        controller: salaryControler,
                        decoration: InputDecoration(
                          labelText: salaryHideText,
                          labelStyle:
                              TextStyle(color: labelTextColor, fontSize: 14),
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
                      width: widths * 0.87,
                      height: 60,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            sexText,
                            style: TextStyle(
                                color: black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    gradient: isMale
                                        ? LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomCenter,
                                            colors: blackGradientColor,
                                          )
                                        : null),
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
                                margin:
                                    const EdgeInsets.only(right: 10, left: 10),
                                decoration: BoxDecoration(
                                    gradient: !isMale
                                        ? LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomCenter,
                                            colors: blackGradientColor,
                                          )
                                        : null),
                                child: Checkbox(
                                  value: !isMale,
                                  onChanged: (value) {
                                    setState(() {
                                      isMale = !isMale;
                                    });
                                  },
                                  activeColor: Colors.transparent,
                                ),
                              ),
                              const Text(femaleText),
                            ],
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
          Container(
            width: double.infinity,
            height: 80,
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
                    applyBtText,
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
