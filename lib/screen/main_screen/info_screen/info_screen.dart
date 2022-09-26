import 'package:acs_project_example/mock_data.dart';
import 'package:acs_project_example/state_manager/provider_controller.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderController>(
      builder: (context, value, child) => Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.png"), fit: BoxFit.cover)
              // gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: [blackGradientColorBot, blackGradientColorTop])
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(userNow["avatarUrl"]),
                            radius: 55,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Center(
                              child: Text(userNow["name"],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: colorTextWhite)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Center(
                              child: Text(
                                  userNow["phoneNumber"]
                                      .toString()
                                      .replaceAllMapped(
                                          RegExp(r'(\d+)(\d{3})(\d{3})'),
                                          (Match m) =>
                                              "${m[1]} - ${m[2]} - ${m[3]}"),
                                  style: TextStyle(
                                      fontSize: 13, color: colorTextWhite)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "images/icon_pencil.png",
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: backgroudWhiteItem,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 20,
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/icon_check_list.png",
                                width: 20,
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                    mbtiText + userNow["mbti"].toString(),
                                    style: const TextStyle(fontSize: 12)),
                              )
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/icon_iq.png",
                                width: 20,
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(iqText + userNow["iq"].toString(),
                                    style: const TextStyle(fontSize: 12)),
                              )
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/icon_education.png",
                                width: 20,
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(miText + userNow["mi"].toString(),
                                    style: const TextStyle(fontSize: 12)),
                              )
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/icon_disc.png",
                                width: 20,
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                    discText + userNow["disc"].toString(),
                                    style: const TextStyle(fontSize: 12)),
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Image.asset("images/icon_doc.png",
                              width: 23, height: 23, color: Colors.black87),
                          Container(
                            height: 60,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              youPostText,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Image.asset("images/icon_logout.png",
                              width: 23, height: 23, color: Colors.black87),
                          Container(
                            height: 60,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              logOutText,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
