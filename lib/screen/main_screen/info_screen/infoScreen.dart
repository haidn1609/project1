import 'package:acs_project_example/mock_data.dart';
import 'package:acs_project_example/state_manager/providerController.dart';
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
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.cover)),
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
                              backgroundImage: isLogin
                                  ? NetworkImage(userNow["avatarUrl"])
                                  : const AssetImage("images/icon_user.png")
                                      as ImageProvider,
                              radius: 55,
                              backgroundColor: isLogin ? null : Colors.grey),
                          isLogin
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Center(
                                    child: Text(userNow["name"],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: colorTextWhite)),
                                  ),
                                )
                              : Container(),
                          isLogin
                              ? Padding(
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
                                            fontSize: 13,
                                            color: colorTextWhite)),
                                  ),
                                )
                              : Container()
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
                                    mbtiText +
                                        (isLogin
                                            ? userNow["mbti"].toString()
                                            : "0"),
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
                                child: Text(
                                    iqText +
                                        (isLogin
                                            ? userNow["iq"].toString()
                                            : "0"),
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
                                child: Text(
                                    miText +
                                        (isLogin
                                            ? userNow["mi"].toString()
                                            : "0"),
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
                                    discText +
                                        (isLogin
                                            ? userNow["disc"].toString()
                                            : "0"),
                                    style: const TextStyle(fontSize: 12)),
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                    isLogin
                        ? Container(
                            width: double.infinity,
                            height: 60,
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Image.asset("images/icon_doc.png",
                                    width: 23,
                                    height: 23,
                                    color: Colors.black87),
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
                          )
                        : Container(),
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
                            child: Text(
                              isLogin ? logOutText : logInText,
                              style: const TextStyle(
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
