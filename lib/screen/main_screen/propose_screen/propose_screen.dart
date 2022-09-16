import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/widget/stateless/gradientWidget.dart';
import 'package:flutter/material.dart';

class ProposeScreen extends StatefulWidget {
  const ProposeScreen({Key? key}) : super(key: key);

  @override
  State<ProposeScreen> createState() => _ProposeScreenState();
}

class _ProposeScreenState extends State<ProposeScreen> {
  List<String> listBranch = ["Ui-Ux Designer", "Graphic Designer"];

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/propose_screen_backgroud.jpg"),
                fit: BoxFit.fill)),
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
                          Container(
                            //margin: EdgeInsets.only(right: 25),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: backgroudOpacity1,
                                borderRadius: BorderRadius.circular(1000),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                                child: GradientWidget(colors: [
                              yellowGradientColorTop,
                              yellowGradientColorBot
                            ], child: const Icon(Icons.lightbulb, size: 25))),
                          ),
                          Container(
                            //margin: EdgeInsets.only(right: 25),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: backgroudOpacity2,
                                borderRadius: BorderRadius.circular(1000),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                                child: GradientWidget(
                                    colors: [
                                  purpleGradientColorTop,
                                  purpleGradientColorBot
                                ],
                                    child: Image.asset(
                                      "images/icon_add_user.png",
                                      width: 25,
                                      height: 25,
                                      fit: BoxFit.contain,
                                    ))),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: backgroudOpacity2,
                                borderRadius: BorderRadius.circular(1000),
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                                child: GradientWidget(
                                    colors: [
                                  pinkGradientColorTop,
                                  pinkGradientColorBot
                                ],
                                    child: Image.asset(
                                      "images/icon_settings.png",
                                      width: 25,
                                      height: 25,
                                      fit: BoxFit.contain,
                                    ))),
                          ),
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
                                padding: const EdgeInsets.only(top: 10, bottom: 15),
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
                                        strutStyle: const StrutStyle(fontSize: 12),
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
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: backgroudOpacity2,
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(width: 2, color: Colors.white)),
                        child: Center(
                            child: GradientWidget(
                                colors: [
                              pinkGradientColorTop,
                              pinkGradientColorBot
                            ],
                                child: Image.asset(
                                  "images/icon_favorite.png",
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.contain,
                                ))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: backgroudOpacity2,
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(width: 2, color: Colors.white)),
                        child: Center(
                            child: GradientWidget(
                                colors: [
                              greenGradientColorTop,
                              greenGradientColorBot
                            ],
                                child: Image.asset(
                                  "images/icon_chat.png",
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.contain,
                                ))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  yellowGradientColorTop,
                                  yellowGradientColorBot
                                ]),
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
                        width: 50,
                        height: 50,
                        child: Center(
                            child: GradientWidget(colors: [
                          blackGradientColorTop,
                          blackGradientColorBot
                        ], child: Image.asset(
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
