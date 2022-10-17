import 'dart:math';

import 'package:acs_project_example/state_manager/dataPostProvider.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:acs_project_example/widget/stateless/listViewRequestCandidate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CandidateRequest extends StatelessWidget {
  const CandidateRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataPostProvider>(context, listen: false);
    var randomItem = dataProvider.listPost
        .elementAt(Random().nextInt(dataProvider.listPost.length));
    return Consumer<DataPostProvider>(
      builder: (context, value, child) => SizedBox(
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(requestJobCandidateText,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    "images/icon_next_arrrow.png",
                    width: 17,
                    height: 17,
                  ),
                ))
              ],
            ),
            ListViewRequestCandidate(
              listPost: value.listPost,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: blackGradientColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    randomItem.thumbnailUrl.toString(),
                    width: 50,
                    height: 50,
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            randomItem.title.toString(),
                            style: TextStyle(
                                color: colorTextWhite,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(
                              randomItem.salary!.isEmpty
                                  ? "Lương thỏa thuận"
                                  : randomItem.salary!.join(','),
                              style: TextStyle(
                                color: colorTextWhite,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Hạn tuyển dụng ${DateFormat('dd-MM-yyyy').format(randomItem.modified!)}",
                              style: TextStyle(
                                color: colorTextWhite,
                                fontSize: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Image.asset(
                      "images/logo_job.png",
                      height: 130,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(bestJobCandidateText,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    "images/icon_next_arrrow.png",
                    width: 17,
                    height: 17,
                  ),
                ))
              ],
            ),
            ListViewRequestCandidate(
              listPost: value.listPost,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.listWorkingType.length,
              itemBuilder: (context, index) {
                var item = value.listWorkingType.elementAt(index);
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Việc ${item.toString()}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        )),
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            "images/icon_next_arrrow.png",
                            width: 17,
                            height: 17,
                          ),
                        ))
                      ],
                    ),
                    ListViewRequestCandidate(
                      listPost: value.getPostByWorkingType(item.id),
                    ),
                  ],
                );
              },
            ),
            Container(
              height: 110,
            )
          ],
        ),
      ),
    );
  }
}
