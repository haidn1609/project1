import 'package:acs_project_example/screen/splash_screen/second_splash_screen.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstSplashScreen extends StatelessWidget {
  const FirstSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
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
            Text(bannerText,
                style: TextStyle(
                    color: colorText,
                    decoration: TextDecoration.none,
                    fontSize: 20)),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(youIsText,
                  style: TextStyle(
                      color: colorText,
                      decoration: TextDecoration.none,
                      fontSize: 15)),
            ),
            GestureDetector(
              onTap: () {
                print("Ứng viên");
                Get.off(const SecondSplashScreen());
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
                      colors: [blackGradientColorTop, blackGradientColorBot],
                    )),
                child: Center(
                  child: Text(candidateBtText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorTextBt,
                          decoration: TextDecoration.none,
                          fontSize: 16)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("Nhà tuyển dụng");
                Get.off(const SecondSplashScreen());
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
                      colors: [blackGradientColorTop, blackGradientColorBot],
                    )),
                child: Center(
                  child: Text(employerBtText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorTextBt,
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
                        image:
                        AssetImage("images/splash_screen_footer_banner.png"),
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
