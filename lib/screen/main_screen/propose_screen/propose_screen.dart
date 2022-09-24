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
  List<String> listBranch = ["Ui-Ux Designer", "Graphic Designer"];

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
            color: white,
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
                            onTap: () {
                              print("idea");
                            },
                            child: circleIcon(
                                yellowGradientColor, "images/icon_idea.png"),
                          ),
                          InkWell(
                            onTap: () {
                              print("add user");
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
                    Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          child: Center(
                            child: Image.asset("images/match_banner.png",
                                fit: BoxFit.contain, width: widths * 0.65),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          width: widths,
                          margin: const EdgeInsets.only(right: 100),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Cônng ty cổ phần Mama Bé",
                                style: TextStyle(
                                    color: colorTextBt,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "3 giờ trước",
                                  style: TextStyle(
                                      color: colorTextBt, fontSize: 9),
                                ),
                              ),
                              Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 15),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listBranch.length,
                                  itemBuilder: (context, index) => Container(
                                    width: 150,
                                    height: 50,
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color: backgroudBrandItem,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text(
                                      listBranch.elementAt(index),
                                      style: TextStyle(
                                          color: colorTextBt, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
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
                                        strutStyle:
                                            const StrutStyle(fontSize: 12),
                                        text: TextSpan(
                                            text:
                                                "26/134 P. Lê Trọng Tấn, Khương Mai, Thanh Xuân, Hà Nội",
                                            style:
                                                TextStyle(color: colorTextBt))),
                                  ))
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 70,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      circleIcon(pinkGradientColor, "images/icon_favorite.png"),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "380",
                          style: TextStyle(fontSize: 10, color: colorTextBt),
                        ),
                      ),
                      circleIcon(greenGradientColor, "images/icon_chat.png"),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "550",
                          style: TextStyle(fontSize: 10, color: colorTextBt),
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
                          color: white,
                        )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "80%",
                          style: TextStyle(fontSize: 10, color: colorTextBt),
                        ),
                      ),
                      Container(
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
