import 'package:acs_project_example/widget/stateless/itemRequestCandidate.dart';
import 'package:flutter/material.dart';

import '../../model/postModel.dart';

class ListViewRequestCandidate extends StatelessWidget {
  ListViewRequestCandidate({Key? key, this.listPost}) : super(key: key);
  List<PostModel>? listPost;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: listPost!.isEmpty ? null : 200,
      margin: const EdgeInsets.only(top: 25, bottom: 25),
      child: listPost!.isEmpty
          ? Text("Không có công việc phù hợp")
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: listPost?.length,
              itemBuilder: (context, index) {
                return ItemCandidateRequest(item: listPost?.elementAt(index));
              },
            ),
    );
  }
}
