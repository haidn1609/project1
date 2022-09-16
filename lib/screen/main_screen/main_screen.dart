import 'package:acs_project_example/screen/main_screen/info_screen/info_screen.dart';
import 'package:acs_project_example/screen/main_screen/job_screen/job_screen.dart';
import 'package:acs_project_example/screen/main_screen/mess_screen/mess_screen.dart';
import 'package:acs_project_example/screen/main_screen/propose_screen/propose_screen.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:acs_project_example/widget/stateless/gradientWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> listPage = [
    const ProposeScreen(),
    const JobScreen(),
    const MessScreen(),
    const InfoScreen()
  ];

  setCurrent(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget bottomNavigatorBar() {
    return Container(
      height: 60,
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [blackGradientColorTop, blackGradientColorBot])),
      child: Center(
          child: Container(
        padding: EdgeInsets.only(top: 5),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      onPressed: () => setCurrent(0),
                      child: iconBTB("images/icon_propose.png", btbText1, 0),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      onPressed: () => setCurrent(1),
                      child: iconBTB("images/icon_job.png", btbText2, 1),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.bottomCenter,
                child: Text(
                  btbText3,
                  style: TextStyle(color: colorTextBt, fontSize: 12),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      onPressed: () => setCurrent(2),
                      child: iconBTB("images/icon_messenger.png", btbText4, 2),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: MaterialButton(
                        onPressed: () => setCurrent(3),
                        child: iconBTB("images/icon_user.png", btbText5, 3),
                      ))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget iconBTB(String patch, String mess, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        currentIndex != index
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
                )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            mess,
            style: TextStyle(color: colorTextBt, fontSize: 12),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: listPage.elementAt(currentIndex),
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          bottomNavigatorBar(),
          InkWell(
            onTap: () => print("click"),
            child: Container(
              height: 60,
              width: 60,
              margin: EdgeInsets.only(bottom: 60),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        yellowGradientColorTop,
                        yellowGradientColorBot
                      ])),
              child: Center(
                child: Image.asset(
                  "images/icon_paper_plane.png",
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
