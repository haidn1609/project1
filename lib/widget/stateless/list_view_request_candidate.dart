import 'package:acs_project_example/widget/stateless/item_request_candidate.dart';
import 'package:flutter/material.dart';

class ListViewRequestCandidate extends StatelessWidget {
  ListViewRequestCandidate({Key? key, required this.listRequest})
      : super(key: key);
  List<Map<String, dynamic>> listRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.only(top: 25, bottom: 25),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listRequest.length,
        itemBuilder: (context, index) {
          return ItemCandidateRequest(item: listRequest.elementAt(index));
        },
      ),
    );
  }
}
