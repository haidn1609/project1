import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/widget/stateless/itemRequestCandidate.dart';
import 'package:flutter/material.dart';

import '../../model/postModel.dart';

class ShowListPost extends StatefulWidget {
  const ShowListPost({Key? key, required this.listPost, required this.title})
      : super(key: key);
  final List<PostModel> listPost;
  final String title;

  @override
  State<ShowListPost> createState() => _ShowListPostState();
}

class _ShowListPostState extends State<ShowListPost> {
  List<PostModel> listPost = [];
  String title = '';

  @override
  void initState() {
    super.initState();
    listPost = widget.listPost;
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          backgroundColor: colorTextBlack,
          title: Text(title),
          centerTitle: true,
          floating: true,
        ),
      ],
      body: Container(
        color: backgroudWhiteItem,
        child: listPost.isNotEmpty
            ? ListView.builder(
                itemCount: listPost.length,
                itemBuilder: (context, index) =>
                    ItemCandidateRequest(item: listPost.elementAt(index)),
              )
            : Center(
                child: Text(
                  "Không có công việc thích hơp.",
                  style: TextStyle(
                    color: colorTextBlack,
                    decoration: TextDecoration.none,
                    fontSize: 13,
                  ),
                ),
              ),
      ),
    );
  }
}
