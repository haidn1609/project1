import 'package:acs_project_example/mock_data.dart';
import 'package:acs_project_example/state_manager/provider_controller.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:acs_project_example/widget/stateless/item_show_mess.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessScreen extends StatefulWidget {
  const MessScreen({Key? key}) : super(key: key);

  @override
  State<MessScreen> createState() => _MessScreenState();
}

class _MessScreenState extends State<MessScreen> {
  TextEditingController searchController = TextEditingController();
  String searchText = "";

  sortListMess() {
    listMess.sort(
      (a, b) {
        List<Map<String, String>> messA = a["mess"];
        List<Map<String, String>> messB = b["mess"];
        if (messA.isNotEmpty && messB.isNotEmpty) {
          return DateTime.parse(messB.last["timeSend"]!)
              .compareTo(DateTime.parse(messA.last["timeSend"]!));
        } else {
          return -1;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    sortListMess();
    final showList = listMess.where(
      (element) {
        Map<String, dynamic> sender =
            element["user1"]["name"] == userNow["name"]
                ? element["user2"]
                : element["user1"];
        return sender["name"]
            .toString()
            .toLowerCase()
            .contains(searchText.toLowerCase());
      },
    );
    return Consumer<ProviderController>(
      builder: (context, value, child) => Container(
        width: double.infinity,
        height: double.infinity,
        color: backgroudWhiteItem,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              margin: const EdgeInsets.only(bottom: 15),
              child: const Center(
                child: Text(messTabTitle,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            ),
            Container(
              width: widths * 0.90,
              margin: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: searchMessHideText,
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
                onChanged: (value) => setState(() {
                  searchText = value;
                }),
              ),
            ),
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: showList.length,
                  itemBuilder: (context, index) {
                    return ItemShowMess(mess: showList.elementAt(index));
                  },
                ),
                Container(
                  height: 110,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
