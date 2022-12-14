import 'package:acs_project_example/screen/main_screen/job_screen/employerRequest.dart';
import 'package:acs_project_example/state_manager/dataPostProvider.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'candidateRequest.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({Key? key}) : super(key: key);

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  final box = GetStorage();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return Consumer<DataPostProvider>(
      builder: (context, value, child) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: _key,
          drawerEnableOpenDragGesture: false,
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.cover),
            ),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SizedBox(
                width: double.infinity,
                child: ListView(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 230,
                      padding:
                          const EdgeInsets.only(top: 30, left: 25, right: 10),
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
                                    color: backgroudWhiteItem,
                                    size: 40,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  height: 100,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    findJobText,
                                    style: TextStyle(
                                      color: colorTextWhite,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      height: 1.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 250,
                              alignment: Alignment.centerRight,
                              child: Image.asset("images/logo_job.png",
                                  fit: BoxFit.contain),
                            ),
                          ),
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
                                    const EdgeInsets.only(left: 25, right: 40),
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
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      width: widths,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                        ),
                      ),
                      child: Column(
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
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(
                                    "images/icon_settings.png",
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            height: 160,
                            padding: const EdgeInsets.only(top: 15),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: value.listCareer.length,
                              itemBuilder: (context, index) {
                                var item = value.listCareer.elementAt(index);
                                return SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 0),
                                          width: 50,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "images/empty_image.png"),
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                        Container(
                                          height: 45,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 0, 0),
                                          child: Text(
                                            "${item.name}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 5, 0, 0),
                                          child: Text(
                                            "${item.count} ????n tuy???n",
                                            style:
                                                const TextStyle(fontSize: 10),
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
                              ? const CandidateRequest()
                              : const EmployerRequest(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          drawer: Container(
            margin: const EdgeInsets.only(bottom: 150),
            alignment: Alignment.topCenter,
            width: widths * 0.5,
            child: Drawer(
              child: Center(
                child: ListView(
                  controller: scrollController,
                  children: [
                    Text(
                        "you is ${box.read("rule")}\n\n have ${value.listPost.length} item \n\n ${value.listPost.toString()}")
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
