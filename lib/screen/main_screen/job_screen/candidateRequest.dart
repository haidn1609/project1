import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:acs_project_example/widget/stateless/list_view_request_candidate.dart';
import 'package:flutter/material.dart';

import '../../../mock_data.dart';

class CandidateRequest extends StatelessWidget {
  CandidateRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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
            listRequest: listRequest,
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [blackGradientColorTop, blackGradientColorBot])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  listRequest.elementAt(0)["logoImg"],
                  width: 40,
                  height: 40,
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listRequest.elementAt(0)["nameJob"],
                          style: TextStyle(
                              color: colorTextBt,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                            "Mức lương: ${listRequest.elementAt(0)["minSalary"]} tr",
                            style: TextStyle(
                                color: colorTextBt,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            listRequest.elementAt(0)["endDate"],
                            style: TextStyle(
                              color: colorTextBt,
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
            listRequest: listRequest,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(managerJobCandidateText,
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
            listRequest: listRequest,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(internJobCandidateText,
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
            listRequest: listRequest,
          ),
          Container(
            height: 110,
          )
        ],
      ),
    );
  }
}
