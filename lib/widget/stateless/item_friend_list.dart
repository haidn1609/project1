import 'package:acs_project_example/mock_data.dart';
import 'package:acs_project_example/screen/main_screen/mess_screen/mess_contend_screen.dart';
import 'package:acs_project_example/widget/stateless/gradient_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../value/colors.dart';

class ItemFriendList extends StatelessWidget {
  ItemFriendList({Key? key, required this.item}) : super(key: key);
  Map<String, dynamic> item;

  void openMess() {
    List<Map<String, dynamic>> searchList = listMess
        .where(
          (element) =>
              item["name"] == element["user1"]["name"] ||
              item["name"] == element["user2"]["name"],
        )
        .toList();
    if (searchList.isNotEmpty) {
      Get.to(MessContendScreen(mess: searchList.first));
    } else {
      Map<String, dynamic> newMess = {
        "user1": {"name": item["name"], "avatar": item["avatar"]},
        "user2": {"name": userNow["name"], "avatar": userNow["avatarUrl"]},
        "mess": <Map<String, String>>[
          {
            "sender": userNow["name"],
            "avatar": userNow["avatarUrl"],
            "timeSend": DateTime.now().toString(),
            "contend": "",
            "status": "unread"
          },
        ]
      };
      listMess.add(newMess);
      Get.to(MessContendScreen(mess: listMess.last));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 70,
      margin: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: borderBlackColor, width: 0.5),
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: NetworkImage(item["avatar"]),
                    alignment: Alignment.center)),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            child: Text(item["name"]),
          )),
          SizedBox(
            width: 30,
            height: 30,
            child: InkWell(
              onTap: () => openMess(),
              child: GradientWidget(
                  colors: greenGradientColor,
                  child: Image.asset(
                    "images/icon_chat.png",
                    fit: BoxFit.contain,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
