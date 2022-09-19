import 'package:acs_project_example/screen/main_screen/job_screen/employerRequest.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../mock_data.dart';
import 'candidateRequest.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({Key? key}) : super(key: key);

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  final box = GetStorage();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      drawerEnableOpenDragGesture: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [blackGradientColorBot, blackGradientColorTop],
        )),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: Container(
            width: double.infinity,
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 230,
                  padding: const EdgeInsets.only(top: 30, left: 25, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                _key.currentState!.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu,
                                color: white,
                                size: 40,
                              )),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            height: 100,
                            alignment: Alignment.centerLeft,
                            child: Text(findJobText,
                                style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  height: 1.5,
                                )),
                          )
                        ],
                      )),
                      Expanded(
                          child: Container(
                        height: 250,
                        alignment: Alignment.centerRight,
                        child: Image.asset("images/logo_job.png",
                            fit: BoxFit.contain),
                      )),
                    ],
                  ),
                ),
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: widths * 0.80,
                        height: 60,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 25, right: 40),
                            hintText: searchTextFeldText,
                            filled: true,
                            fillColor: backgroudOpacity2,
                            focusColor: backgroudOpacity2,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          showCursor: false,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 15,
                        child: Image.asset(
                          "images/icon_search.png",
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  width: widths,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35)),
                  ),
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
                                    careerText,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(
                                    "images/icon_settings.png",
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.contain,
                                  )))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        height: 160,
                        padding: EdgeInsets.only(top: 15),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: listJobLogo.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> item =
                                listJobLogo.elementAt(index);
                            return SizedBox(
                              width: 160,
                              height: 160,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(item["patch"]),
                                              fit: BoxFit.contain)),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 0, 15),
                                      child: Text(
                                        "${item["nameJob"]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                      child: Text(
                                        "${item["count"]} đơn tuyển",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      box.read("rule") == candidateBtText
                          ? CandidateRequest()
                          : EmployerRequest(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Container(
        margin: EdgeInsets.only(bottom: 150),
        alignment: Alignment.topCenter,
        width: widths * 0.5,
        child: Drawer(
          child: Center(
            child: Text("you is ${box.read("rule")}"),
          ),
        ),
      ),
    );
  }
}