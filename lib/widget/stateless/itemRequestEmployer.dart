import 'package:acs_project_example/value/colors.dart';
import 'package:flutter/material.dart';

class ItemRequestEmployer extends StatelessWidget {
  const ItemRequestEmployer({Key? key, required this.item}) : super(key: key);
  final Map<String, dynamic> item;

  String salary(int minSalary, int maxSalary) {
    if (minSalary > 0 && maxSalary == 0) {
      return "Trên $minSalary triệu";
    } else if (minSalary == 0 && maxSalary > 0) {
      return "Trên $maxSalary triệu";
    }
    return "Từ ${minSalary}triệu - ${maxSalary}triệu";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: backgroudWhiteItem,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(item["avatar"]),
                radius: 20,
              ),
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item["name"],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(5),
            height: 20,
            alignment: Alignment.centerLeft,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: item["listBranch"].length,
              itemBuilder: (context, index) => Container(
                height: 20,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: blackGradientColor),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  item["listBranch"].elementAt(index),
                  style: TextStyle(color: colorTextWhite, fontSize: 10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 10, 25, 0),
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
                          child: Text(
                            "Khu vực ${item["location"]}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 10, 25, 0),
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
                            "Mức lương: ${salary(item["minSalary"], item["maxSalary"])}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 10, 25, 0),
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
                            "Kinh nghiệm: ${item["exp"]}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
