import 'package:acs_project_example/state_manager/provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../../screen/post_new_screen/post_new_by_candidate.dart';
import '../../screen/post_new_screen/post_new_by_employer.dart';
import '../../value/colors.dart';
import '../../value/strings.dart';
import 'gradient_widget.dart';

class BottomNavigatorBarCus extends StatelessWidget {
  BottomNavigatorBarCus({Key? key}) : super(key: key);

  Widget iconBTB(String patch, int index) {
    return Consumer<ProviderController>(
      builder: (context, value, child) => value.currentTab != index
          ? Image.asset(
              patch,
              width: 25,
              height: 25,
              fit: BoxFit.contain,
              color: dontSelectBtBNB,
            )
          : GradientWidget(
              colors: yellowGradientColor,
              child: Image.asset(
                patch,
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              ),
            ),
    );
  }

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ProviderController>(
      builder: (context, value, child) => Container(
        width: size.width,
        height: 120,
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: blackGradientColor)
                  .createShader(bounds),
              child: CustomPaint(
                size: Size(size.width * 0.9, 60),
                painter: BNBCustomPainted(),
              ),
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
                        colors: yellowGradientColor)),
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
            ),
            SizedBox(
              width: size.width * 0.9,
              height: 60,
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
                        onTap: () {
                          value.setCurrentTab(0);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            iconBTB("images/icon_propose.png", 0),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                btbText1,
                                style: TextStyle(
                                    color: colorTextWhite, fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          value.setCurrentTab(1);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            iconBTB(
                                box.read("rule") == candidateBtText
                                    ? "images/icon_job.png"
                                    : "images/icon_group.png",
                                1),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                box.read("rule") == candidateBtText
                                    ? btbText2_1
                                    : btbText2_2,
                                style: TextStyle(
                                    color: colorTextWhite, fontSize: 10),
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
                          style: TextStyle(color: colorTextWhite, fontSize: 12),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          value.setCurrentTab(2);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            iconBTB("images/icon_messenger.png", 2),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                btbText4,
                                style: TextStyle(
                                    color: colorTextWhite, fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            value.setCurrentTab(3);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              iconBTB("images/icon_user.png", 3),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  btbText5,
                                  style: TextStyle(
                                      color: colorTextWhite, fontSize: 10),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainted extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(size.width * 0.1, size.height);
    path.arcToPoint(Offset(size.width * 0.1, 0),
        radius: const Radius.circular(30));
    path.lineTo(size.width * 0.5 - 70, 0);
    path.quadraticBezierTo(
        size.width * 0.5 - 40, 0, size.width * 0.5 - 30, size.height * 0.25);
    path.arcToPoint(Offset(size.width * 0.5 + 30, size.height * 0.25),
        clockwise: false, radius: const Radius.circular(33));
    path.quadraticBezierTo(size.width * 0.5 + 40, 0, size.width * 0.5 + 70, 0);
    path.lineTo(size.width * 0.9, 0);
    path.arcToPoint(Offset(size.width * 0.9, size.height),
        radius: const Radius.circular(30));
    path.lineTo(size.width * 0.1, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
