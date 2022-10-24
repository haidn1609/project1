import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';

import '../../mock_data.dart';
import '../../value/colors.dart';
import '../../value/strings.dart';

class PostNewEmployer extends StatefulWidget {
  const PostNewEmployer({Key? key}) : super(key: key);

  @override
  State<PostNewEmployer> createState() => _PostNewEmployerState();
}

class _PostNewEmployerState extends State<PostNewEmployer> {
  TextEditingController nameEdit = TextEditingController();
  TextEditingController titleJobEdit = TextEditingController();
  TextEditingController endTimeEdit = TextEditingController();
  TextEditingController minSalaryEdit = TextEditingController();
  TextEditingController maxSalaryEdit = TextEditingController();
  TextEditingController describeWorkEdit = TextEditingController();
  TextEditingController requestWorkEdit = TextEditingController();

  List<String> listFieldWorkingSelect = [];
  List<String> locationWorkingSelect = [];
  String expSelect = "";
  bool isExpOpen = false;
  List<String> languageSelect = [];

  Future _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1975),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      setState(() {
        endTimeEdit.text = "${picked.day}/${picked.month}/${picked.year}";
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
                    child: Container(
                      width: 30,
                      height: 30,
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
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            controller: nameEdit,
                            decoration: InputDecoration(
                              labelText: employerNameHideText,
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
                            showCursor: false,
                          ),
                        ),
                        Container(
                          width: widths * 0.90,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: titleJobEdit,
                            decoration: InputDecoration(
                              labelText: titleJobHideText,
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
                            showCursor: false,
                          ),
                        ),
                        Container(
                          width: widths * 0.9,
                          height: 60,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: backgroudWhiteItem,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropDownMultiSelect(
                            //whenEmpty: languageHideText,
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
                                listFieldWorkingSelect = x;
                              });
                            },
                            options: listFieldWorking,
                            selectedValues: listFieldWorkingSelect,
                          ),
                        ),
                        Container(
                          width: widths * 0.9,
                          height: 60,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: backgroudWhiteItem,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropDownMultiSelect(
                            //whenEmpty: languageHideText,
                            icon: Icon(Icons.arrow_drop_down,
                                color: backgroudOpacity1),
                            decoration: InputDecoration(
                              labelText: locationWorkingHideTextE,
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
                            options: listCountry,
                            selectedValues: locationWorkingSelect,
                          ),
                        ),
                        Container(
                          width: widths * 0.9,
                          height: 60,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: TextField(
                                    controller: minSalaryEdit,
                                    decoration: InputDecoration(
                                      labelText: minSalaryHideText,
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
                                    showCursor: false,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: TextField(
                                    controller: maxSalaryEdit,
                                    decoration: InputDecoration(
                                      labelText: maxSalaryHideText,
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
                                    showCursor: false,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: widths * 0.90,
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: TextField(
                                controller: endTimeEdit,
                                decoration: InputDecoration(
                                  labelText: endTimeHideText,
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
                                showCursor: false,
                              ),
                            ),
                            Positioned(
                              top: 25,
                              right: 15,
                              child: InkWell(
                                onTap: () => _pickDate(),
                                child: Image.asset(
                                  "images/icon_calendar.png",
                                  width: 25,
                                  height: 25,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: widths * 0.9,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: backgroudWhiteItem,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: widths * 0.9,
                                child: ExpansionTile(
                                  maintainState: isExpOpen,
                                  title: expSelect.isEmpty
                                      ? const Text(
                                          expHideText,
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                        )
                                      : Text(expSelect),
                                  trailing: const Icon(Icons.arrow_drop_down,
                                      color: Colors.transparent, size: 40),
                                  children: listExpWorking
                                      .map(
                                        (e) => ListTile(
                                          title: Text(e),
                                          onTap: () {
                                            setState(() {
                                              expSelect = e;
                                              isExpOpen = false;
                                            });
                                          },
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              const Positioned(
                                right: 0,
                                top: 5,
                                child: Icon(Icons.arrow_drop_down,
                                    color: Colors.black, size: 40),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: widths * 0.9,
                          height: 60,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: backgroudWhiteItem,
                            borderRadius: BorderRadius.circular(30),
                          ),
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
                                languageSelect = x;
                              });
                            },
                            options: listLanguage,
                            selectedValues: languageSelect,
                          ),
                        ),
                        Container(
                          width: widths * 0.90,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: describeWorkEdit,
                            maxLines: 7,
                            decoration: InputDecoration(
                              labelText: describeWorkHideText,
                              alignLabelWithHint: true,
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
                            showCursor: false,
                          ),
                        ),
                        Container(
                          width: widths * 0.90,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: requestWorkEdit,
                            maxLines: 7,
                            decoration: InputDecoration(
                              labelText: requestWorkHideText,
                              alignLabelWithHint: true,
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
                            showCursor: false,
                          ),
                        ),
                        Container(
                          width: widths * 0.9,
                          height: 110,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: blackGradientColor),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 15),
                                          child: Text(
                                            pickImageText,
                                            style: TextStyle(
                                                color: colorTextWhite,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            alignment: Alignment.bottomRight,
                                            child: Image.asset(
                                              "images/icon_image.png",
                                              color: backgroudOpacity2,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: blackGradientColor),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 15),
                                          child: Text(
                                            pickCameraText,
                                            style: TextStyle(
                                                color: colorTextWhite,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            alignment: Alignment.bottomRight,
                                            child: Image.asset(
                                              "images/icon_camera.png",
                                              color: backgroudOpacity2,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
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
                        colors: blackGradientColor),
                  ),
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
        ),
      ),
    );
  }
}
