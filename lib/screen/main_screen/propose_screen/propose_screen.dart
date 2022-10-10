import 'dart:async';

import 'package:acs_project_example/mock_data.dart';
import 'package:acs_project_example/screen/filter_screen/filter_screen.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/widget/stateless/gradient_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stateless/item_friend_list.dart';

class ProposeScreen extends StatefulWidget {
  const ProposeScreen({Key? key}) : super(key: key);

  @override
  State<ProposeScreen> createState() => _ProposeScreenState();
}

class _ProposeScreenState extends State<ProposeScreen> {
  List<String> listBranch = [
    "Ui-Ux Designer",
    "Graphic Designer",
    "Ui-Ux Designer",
    "Graphic Designer",
    "Ui-Ux Designer",
    "Graphic Designer",
    "Dev"
  ];

  Widget circleIcon(List<Color> colors, String patch) {
    return Container(
      //margin: EdgeInsets.only(right: 25),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: backgroudOpacity2,
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(width: 2, color: Colors.white)),
      child: Center(
          child: GradientWidget(
              colors: colors,
              child: Image.asset(
                patch,
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              ))),
    );
  }

  Future openListFriend() async {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 120,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroudWhiteItem,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: listFriend.length,
          itemBuilder: (context, index) =>
              ItemFriendList(item: listFriend.elementAt(index)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/propose_screen_backgroud.jpg"),
                fit: BoxFit.cover)),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 122),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      margin: const EdgeInsets.only(top: 25),
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: circleIcon(
                                yellowGradientColor, "images/icon_idea.png"),
                          ),
                          InkWell(
                            onTap: () {
                              openListFriend();
                            },
                            child: circleIcon(purpleGradientColor,
                                "images/icon_add_user.png"),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(const FilterScreen(),
                                  duration: const Duration(milliseconds: 800),
                                  transition: Transition.upToDown);
                            },
                            child: circleIcon(
                                pinkGradientColor, "images/icon_settings.png"),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: widths,
                      height: 300,
                      margin: const EdgeInsets.only(right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Cônng ty cổ phần Mama Bé",
                              style: TextStyle(
                                  color: colorTextWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 15),
                            child: Text(
                              "3 giờ trước",
                              style:
                                  TextStyle(color: colorTextWhite, fontSize: 9),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              direction: Axis.horizontal,
                              runSpacing: 5,
                              spacing: 5,
                              children: listBranch
                                  .map((e) => Chip(
                                        label: Text(
                                          e,
                                          style: TextStyle(
                                              color: colorTextWhite,
                                              fontSize: 8),
                                        ),
                                        backgroundColor: backgroudBrandItem,
                                      ))
                                  .toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "images/icon_ping_map.png",
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.contain,
                                  color: dontSelectBtBNB,
                                ),
                                Flexible(
                                    child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      strutStyle: const StrutStyle(fontSize: 12),
                                      text: TextSpan(
                                          text:
                                              "26/134 P. Lê Trọng Tấn, Khương Mai, Thanh Xuân, Hà Nội",
                                          style:
                                              TextStyle(color: colorTextWhite))),
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Center(
                  child: Image.asset("images/match_banner.png",
                      fit: BoxFit.contain, width: widths * 0.65),
                ),
              ),
              Positioned(
                  right:10,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      circleIcon(pinkGradientColor, "images/icon_favorite.png"),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "380",
                          style: TextStyle(fontSize: 10, color: colorTextWhite),
                        ),
                      ),
                      circleIcon(greenGradientColor, "images/icon_chat.png"),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "550",
                          style: TextStyle(fontSize: 10, color: colorTextWhite),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: yellowGradientColor),
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(width: 2, color: Colors.white)),
                        child: Center(
                            child: Image.asset(
                          "images/icon_reverse.png",
                          width: 25,
                          height: 25,
                          fit: BoxFit.contain,
                          color: backgroudWhiteItem,
                        )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "80%",
                          style: TextStyle(fontSize: 10, color: colorTextWhite),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(
                            child: GradientWidget(
                                colors: blackGradientColor,
                                child: Image.asset(
                                  "images/icon_download.png",
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.contain,
                                ))),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
