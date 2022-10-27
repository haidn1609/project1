import 'package:acs_project_example/widget/stateless/itemRequestEmployer.dart';
import 'package:flutter/material.dart';

import '../../../mock_data.dart';
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
                  child: const Text(
                    requestJobEmployerText,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    "images/icon_next_arrrow.png",
                    width: 17,
                    height: 17,
                  ),
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 25, bottom: 25),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listRequestCandidate.length,
              itemBuilder: (context, index) => ItemRequestEmployer(
                item: listRequestCandidate.elementAt(index),
              ),
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
