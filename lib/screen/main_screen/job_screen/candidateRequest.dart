import 'dart:math';

import 'package:acs_project_example/screen/main_screen/job_screen/contentPostScreen.dart';
import 'package:acs_project_example/state_manager/dataPostProvider.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:acs_project_example/widget/stateless/listViewRequestCandidate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../request_api/postRequestApi.dart';
import '../../show_content_screen/ShowListPost.dart';

class CandidateRequest extends StatelessWidget {
  const CandidateRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataPostProvider>(context, listen: false);
    var randomItem = dataProvider.listPost.elementAt(
      Random().nextInt(dataProvider.listPost.length),
    );
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
                    child: const Text(
                      requestJobCandidateText,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        ShowListPost(
                            listPost: value.listPost,
                            title: requestJobCandidateText),
                        duration: const Duration(seconds: 1),
                        transition: Transition.upToDown,
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        "images/icon_next_arrrow.png",
                        width: 17,
                        height: 17,
                      ),
                    ),
                  ),
                )
              ],
            ),
            ListViewRequestCandidate(
              listPost: value.listPost,
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  ContentPostScreen(post: randomItem),
                  transition: Transition.upToDown,
                  duration: const Duration(seconds: 1),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: blackGradientColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kIsWeb
                        ? Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(
                                  randomItem.thumbnailUrl.toString(),
                                ),
                              ),
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: randomItem.thumbnailUrl.toString(),
                            width: 50,
                            height: 50,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image.asset(
                              "images/empty_image.png",
                              width: 50,
                              height: 50,
                            ),
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      bestJobCandidateText,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        ShowListPost(
                            listPost: value.listPost,
                            title: bestJobCandidateText),
                        duration: const Duration(seconds: 1),
                        transition: Transition.upToDown,
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        "images/icon_next_arrrow.png",
                        width: 17,
                        height: 17,
                      ),
                    ),
                  ),
                )
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
                            child: Text(
                              "Việc ${item.toString()}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              value.setLoading(true);
                              await getApiPost(
                                      subRequest: subApiWorkingType,
                                      idSubRequest: item.id,
                                      page: 1,
                                      listCareer: value.listCareer,
                                      listCategory: value.listCategory,
                                      listCompany: value.listCompany,
                                      listLocation: value.listLocation,
                                      listSalary: value.listSalary,
                                      listWorkingType: value.listWorkingType)
                                  .then(
                                (value) => Get.to(
                                  ShowListPost(
                                      listPost: value, title: item.toString()),
                                  duration: const Duration(seconds: 1),
                                  transition: Transition.upToDown,
                                ),
                              );
                              value.setLoading(false);
                            },
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                "images/icon_next_arrrow.png",
                                width: 17,
                                height: 17,
                              ),
                            ),
                          ),
                        )
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
