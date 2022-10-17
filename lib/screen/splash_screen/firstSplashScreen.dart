import 'package:acs_project_example/screen/splash_screen/secondSplashScreen.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FirstSplashScreen extends StatelessWidget {
  FirstSplashScreen({Key? key}) : super(key: key);
  final box = GetStorage();

  void setFirstInstall() {
    box.write("FistInstall", true);
  }

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    setFirstInstall();
    return Scaffold(
      body: Container(
        width: widths,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/splash_screen_background.png"),
          fit: BoxFit.fill,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "images/splash_screen_banner.png",
              width: widths * 0.5,
              fit: BoxFit.contain,
            ),
            Image.asset(
              "images/splash_screen_logo.png",
              width: widths * 0.15,
              fit: BoxFit.contain,
            ),
            Text(banner1Text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: bannerColorText,
                    decoration: TextDecoration.none,
                    fontSize: 20)),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(youIsText,
                  style: TextStyle(
                      color: bannerColorText,
                      decoration: TextDecoration.none,
                      fontSize: 15)),
            ),
            GestureDetector(
              onTap: () {
                box.write("rule", candidateBtText);
                Get.to(SecondSplashScreen(),
                    transition: Transition.leftToRight,
                    duration: const Duration(seconds: 1));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: blackGradientColor,
                    )),
                child: Center(
                  child: Text(candidateBtText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorTextWhite,
                          decoration: TextDecoration.none,
                          fontSize: 16)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                box.write("rule", employerBtText);
                Get.to(SecondSplashScreen(),
                    transition: Transition.leftToRight,
                    duration: const Duration(seconds: 1));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: blackGradientColor,
                    )),
                child: Center(
                  child: Text(employerBtText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorTextWhite,
                          decoration: TextDecoration.none,
                          fontSize: 16)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                width: widths * 0.75,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "images/splash_screen_footer_banner.png"),
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomCenter)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
