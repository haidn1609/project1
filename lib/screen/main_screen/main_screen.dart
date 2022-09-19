import 'package:acs_project_example/screen/main_screen/info_screen/info_screen.dart';
import 'package:acs_project_example/screen/main_screen/job_screen/job_screen.dart';
import 'package:acs_project_example/screen/main_screen/mess_screen/mess_screen.dart';
import 'package:acs_project_example/screen/main_screen/propose_screen/propose_screen.dart';
import 'package:acs_project_example/screen/post_new_screen/post_new_by_candidate.dart';
import 'package:acs_project_example/screen/post_new_screen/post_new_by_employer.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:acs_project_example/widget/stateless/gradientWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 1;
  final List<Widget> listPage = [
    const ProposeScreen(),
    const JobScreen(),
    const MessScreen(),
    const InfoScreen()
  ];
  final box = GetStorage();

  setCurrent(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget bottomNavigatorBar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 60,
          margin: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [blackGradientColorTop, blackGradientColorBot])),
          child: Center(
              child: Container(
            padding: const EdgeInsets.only(top: 5),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      currentIndex = 0;
                    }),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        iconBTB("images/icon_propose.png", 0),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            btbText1,
                            style: TextStyle(color: colorTextBt, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      currentIndex = 1;
                    }),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        iconBTB("images/icon_job.png", 1),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            btbText2,
                            style: TextStyle(color: colorTextBt, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      btbText3,
                      style: TextStyle(color: colorTextBt, fontSize: 12),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      currentIndex = 2;
                    }),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        iconBTB("images/icon_messenger.png", 2),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            btbText4,
                            style: TextStyle(color: colorTextBt, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => setState(() {
                        currentIndex = 3;
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          iconBTB("images/icon_user.png", 3),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              btbText5,
                              style:
                                  TextStyle(color: colorTextBt, fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )),
        ),
        InkWell(
          onTap: () {
            box.read("rule") == candidateBtText
                ? Get.to(const PostNewCandidate(),
                    transition: Transition.upToDown,
                    duration: const Duration(seconds: 1))
                : Get.to(const PostNewEmployer(),
                    transition: Transition.upToDown,
                    duration: const Duration(seconds: 1));
          },
          child: Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(bottom: 60),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [yellowGradientColorTop, yellowGradientColorBot])),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 5),
              child: Image.asset(
                "images/icon_paper_plane.png",
                width: 30,
                height: 30,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget iconBTB(String patch, int index) {
    return currentIndex != index
        ? Image.asset(
            patch,
            width: 25,
            height: 25,
            fit: BoxFit.contain,
            color: dontSelectBtBNB,
          )
        : GradientWidget(
            colors: [yellowGradientColorTop, yellowGradientColorBot],
            child: Image.asset(
              patch,
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          listPage.elementAt(currentIndex),
          Container(
            margin: EdgeInsets.only(top: height * 0.85),
            child: bottomNavigatorBar(),
          )
        ],
      ),
    ));
  }
}
