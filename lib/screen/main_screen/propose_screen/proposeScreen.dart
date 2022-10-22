import 'dart:async';

import 'package:acs_project_example/mock_data.dart';
import 'package:acs_project_example/screen/filter_screen/filterScreen.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/widget/stateless/gradientWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stateless/itemFriendList.dart';

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

  List<Widget> listViews = [
    const ShowContent(),
    const ShowContent(),
    const ShowContent(),
    const ShowContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            children: listViews,
          ),
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
                  child: CircleIcon(
                      colors: yellowGradientColor,
                      patch: "images/icon_idea.png"),
                ),
                InkWell(
                  onTap: () {
                    openListFriend();
                  },
                  child: CircleIcon(
                      colors: purpleGradientColor,
                      patch: "images/icon_add_user.png"),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const FilterScreen(),
                        duration: const Duration(milliseconds: 800),
                        transition: Transition.upToDown);
                  },
                  child: CircleIcon(
                      colors: pinkGradientColor,
                      patch: "images/icon_settings.png"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShowContent extends StatelessWidget {
  const ShowContent({Key? key}) : super(key: key);
  final String urlBackgroundDemo =
      "https://nganhangnhanluc.com/wp-content/uploads/2022/10/276310782_3176976519213203_3420899407884183509_n.jpg";
  final String urlLogoDemo =
      "https://nganhangnhanluc.com/wp-content/uploads/2022/09/cropped-logo.jpg";

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          // color: Colors.black87,
          image: DecorationImage(
              image: CachedNetworkImageProvider(urlBackgroundDemo),
              fit: BoxFit.contain),
          gradient: LinearGradient(
            colors: blackGradientColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 122),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Column(
                    children: [
                      const Spacer(),
                      Container(
                        width: widths,
                        margin: const EdgeInsets.only(
                          right: 70,
                          left: 10,
                        ),
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                top: 30,
                              ),
                              child: Text(
                                "Cônng ty cổ phần Mama Bé",
                                style: TextStyle(
                                    color: colorTextWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 15),
                              child: Text(
                                "3 giờ trước",
                                style: TextStyle(
                                    color: colorTextWhite, fontSize: 9),
                              ),
                            ),
                            // Container(
                            //   width: double.infinity,
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Wrap(
                            //     direction: Axis.horizontal,
                            //     runSpacing: 5,
                            //     spacing: 5,
                            //     children: listBranch
                            //         .map((e) => Chip(
                            //               label: Text(
                            //                 e,
                            //                 style: TextStyle(
                            //                     color: colorTextWhite,
                            //                     fontSize: 8),
                            //               ),
                            //               backgroundColor: backgroudBrandItem,
                            //             ))
                            //         .toList(),
                            //   ),
                            // ),
                            Container(
                              width: double.infinity,
                              height: 100,
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                left: 15,
                                right: 10,
                              ),
                              child: Text(demoDescription,
                                  maxLines: 4,
                                  style: TextStyle(
                                      color: colorTextWhite,
                                      fontSize: 14,
                                      decoration: TextDecoration.none,
                                      overflow: TextOverflow.ellipsis)),
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
                                        strutStyle:
                                            const StrutStyle(fontSize: 12),
                                        text: TextSpan(
                                            text:
                                                "26/134 P. Lê Trọng Tấn, Khương Mai, Thanh Xuân, Hà Nội",
                                            style: TextStyle(
                                                color: colorTextWhite))),
                                  ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 175,
                    child: Container(
                      width: 75,
                      height: 80,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(urlLogoDemo),
                            fit: BoxFit.contain),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   child: Center(
            //     child: Image.asset("images/match_banner.png",
            //         fit: BoxFit.contain, width: widths * 0.65),
            //   ),
            // ),
            Positioned(
                right: 10,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleIcon(
                        colors: pinkGradientColor,
                        patch: "images/icon_favorite.png"),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "380",
                        style: TextStyle(fontSize: 10, color: colorTextWhite),
                      ),
                    ),
                    CircleIcon(
                        colors: greenGradientColor,
                        patch: "images/icon_chat.png"),
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
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({Key? key, required this.colors, required this.patch})
      : super(key: key);
  final List<Color> colors;
  final String patch;

  @override
  Widget build(BuildContext context) {
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
}
