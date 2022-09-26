import 'package:acs_project_example/state_manager/provider_controller.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:acs_project_example/widget/stateless/gradient_widget.dart';
import 'package:acs_project_example/widget/stateless/item_content_mess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../mock_data.dart';

class MessContendScreen extends StatefulWidget {
  MessContendScreen({Key? key, required this.mess}) : super(key: key);
  Map<String, dynamic> mess;

  @override
  State<MessContendScreen> createState() => _MessContendScreenState();
}

class _MessContendScreenState extends State<MessContendScreen> {
  late Map<String, dynamic> mess;
  bool isOnline = true;
  TextEditingController chatEdit = TextEditingController();

  @override
  void initState() {
    super.initState();
    mess = widget.mess;
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    Map<String, dynamic> sender = mess["user1"]["name"] == userNow["name"]
        ? mess["user2"]
        : mess["user1"];
    List<Map<String, String>> listContend = mess["mess"];
    return Consumer<ProviderController>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: backgroudWhiteItem,
          leading: InkWell(
            onTap: () {
              value.setDifferenceDay(0);
              Get.back();
            },
            child: Container(
              width: 40,
              alignment: Alignment.center,
              child: Image.asset("images/icon_back_arrrow.png",
                  width: 25, height: 25),
            ),
          ),
          title: SizedBox(
            width: sizes.width - 50,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(sender["avatar"]),
                          fit: BoxFit.contain),
                      borderRadius: BorderRadius.circular(25)),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 60,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            sender["name"],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                const Text(
                                  "Khách mua",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "• ${isOnline ? isOnlineText : isOfflineText}",
                                    style: TextStyle(
                                      color: isOnline
                                          ? isOnlineColor
                                          : isOfflineColor,
                                      fontSize: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              width: sizes.width,
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listContend.length,
                itemBuilder: (context, index) =>
                    ItemContendMess(contend: listContend[index]),
              ),
            )),
            Container(
              padding: const EdgeInsets.all(10),
              width: sizes.width,
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: GradientWidget(
                        colors: blackGradientColor,
                        child: Image.asset(
                          "images/icon_image.png",
                          width: 30,
                          height: 30,
                        )),
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      child: Stack(
                        children: [
                          TextField(
                            controller: chatEdit,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 12, right: 40),
                              hintText: chatHideText,
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
                          Positioned(
                            top: 10,
                            right: 15,
                            child: InkWell(
                              onTap: () {},
                              child: GradientWidget(
                                  colors: blackGradientColor,
                                  child: Image.asset(
                                    "images/icon_smile_fill.png",
                                    width: 20,
                                    height: 20,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                  InkWell(
                    onTap: () {},
                    child: GradientWidget(
                        colors: blackGradientColor,
                        child: Image.asset(
                          "images/icon_send_mess.png",
                          width: 25,
                          height: 25,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
