import 'package:acs_project_example/model/postModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemCandidateRequest extends StatelessWidget {
  ItemCandidateRequest({Key? key, this.item}) : super(key: key);
  PostModel? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
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
                    item!.thumbnailUrl.toString(),
                    fit: BoxFit.contain,
                  ),
                ),
                Flexible(child: Text(item!.title.toString()))
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 70),
              child: Text(
                item!.company!.join(','),
                style: const TextStyle(fontSize: 12),
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
                  child: Text("Khu vực ${item!.location!.join(',')}",
                      style: const TextStyle(fontSize: 12)),
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
                  child: Text(
                      item!.salary!.isEmpty
                          ? "Lương thỏa thuận"
                          : item!.salary!.join(','),
                      style: const TextStyle(fontSize: 12)),
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
                  child: Text(
                      "Hạn tuyển dụng ${DateFormat('dd-MM-yyyy').format(item!.modified!)}",
                      style: const TextStyle(fontSize: 12)),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
