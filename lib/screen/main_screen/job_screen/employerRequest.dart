import 'package:acs_project_example/widget/stateless/item_request_employer.dart';
import 'package:flutter/material.dart';

import '../../../mock_data.dart';
import '../../../value/colors.dart';
import '../../../value/strings.dart';

class EmployerRequest extends StatelessWidget {
  const EmployerRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                child: const Text(requestJobEmployerText,
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
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 25, bottom: 25),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listRequestCandidate.length,
              itemBuilder: (context, index) => index == 2
                  ? Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(5),
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
                                listRequestJob.elementAt(0)["logoImg"],
                                width: 40,
                                height: 40,
                              ),
                              Flexible(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listRequestJob.elementAt(0)["nameJob"],
                                        style: TextStyle(
                                            color: colorTextWhite,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Text(
                                          "Mức lương: ${listRequestJob.elementAt(0)["minSalary"]} tr",
                                          style: TextStyle(
                                              color: colorTextWhite,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          listRequestJob
                                              .elementAt(0)["endDate"],
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
                        ItemRequestEmployer(
                            item: listRequestCandidate.elementAt(index))
                      ],
                    )
                  : ItemRequestEmployer(
                      item: listRequestCandidate.elementAt(index)),
            ),
          ),
          Container(
            height: 80,
          )
        ],
      ),
    );
  }
}
