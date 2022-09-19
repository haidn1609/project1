import 'package:flutter/material.dart';

class ItemCandidateRequest extends StatelessWidget {
  ItemCandidateRequest({Key? key, required this.item}) : super(key: key);
  Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15),
      width: 320,
      height: 200,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  width: 40,
                  height: 40,
                  child: Image.network(
                    item["logoImg"],
                    fit: BoxFit.contain,
                  ),
                ),
                Flexible(child: Text(item["nameJob"]))
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 70),
              child: Text(
                item["company"],
                style: TextStyle(fontSize: 12),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/icon_ping_map_outline.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Flexible(
                    child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("Khu vực ${item["location"]}",
                      style: TextStyle(fontSize: 12)),
                ))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/icon_wallet.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Flexible(
                    child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("Mức lương trên ${item["minSalary"]} triệu",
                      style: TextStyle(fontSize: 12)),
                ))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/icon_calendar_outline.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Flexible(
                    child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("Hạn tuyển dụng ${item["endDate"]}",
                      style: TextStyle(fontSize: 12)),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
