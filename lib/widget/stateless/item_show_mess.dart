import 'package:acs_project_example/mock_data.dart';
import 'package:acs_project_example/screen/main_screen/mess_screen/mess_contend_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemShowMess extends StatelessWidget {
  const ItemShowMess({Key? key, required this.mess}) : super(key: key);
  final Map<String, dynamic> mess;

  String calculatePeriod(DateTime now, DateTime input) {
    return (now.year - input.year) > 0
        ? "${(now.year - input.year)} năm trước"
        : ((now.month - input.month) > 0
            ? "${(now.month - input.month)} tháng trước"
            : ((now.day - input.day) > 0
                ? "${(now.day - input.day)} ngày trước"
                : ((now.hour - input.hour) > 0
                    ? "${(now.hour - input.hour)} giờ trước"
                    : ((now.minute - input.minute) > 0
                        ? "${(now.minute - input.minute)} phút trước"
                        : "vừa mới"))));
  }

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    Map<String, dynamic> sender = mess["user1"]["name"] == userNow["name"]
        ? mess["user2"]
        : mess["user1"];
    List<Map<String, String>> listContent = mess["mess"];
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        Get.to(
            MessContendScreen(
              mess: mess,
            ),
            transition: Transition.downToUp,
            duration: const Duration(milliseconds: 500));
      },
      child: Container(
        width: widths * 0.9,
        height: 60,
        margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image:
                      DecorationImage(image: NetworkImage(sender["avatar"]))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(sender["name"],
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(
                      width: widths <= 420
                          ? widths * 0.6
                          : (widths <= 720 ? widths * 0.7 : widths * 0.8),
                      height: 30,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.only(right: 5),
                              alignment: Alignment.centerLeft,
                              child: listContent
                                      .where((element) =>
                                          element["sender"] == sender["name"] &&
                                          element["status"] == "unread")
                                      .isNotEmpty
                                  ? Text(
                                      "${sender["name"]} đã gửi tin nhắn cho bạn",
                                      style: const TextStyle(fontSize: 10))
                                  : const Text(""),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                calculatePeriod(
                                    DateTime.now(),
                                    listContent.length <= 1
                                        ? DateTime.parse(
                                            listContent.first["timeSend"]!)
                                        : DateTime.parse(listContent
                                            .where((element) =>
                                                element["sender"] ==
                                                sender["name"])
                                            .last["timeSend"]!)),
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
