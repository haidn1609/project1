import 'package:acs_project_example/screen/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../value/colors.dart';
import '../../value/strings.dart';

class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return KeyboardDismisser(
      child: Scaffold(
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
                width: widths * 0.80,
                margin: const EdgeInsets.only(top: 40, bottom: 40),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: phoneTextFeldText,
                    filled: true,
                    fillColor: Colors.white.withOpacity(1),
                    focusColor: Colors.white.withOpacity(1),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        )),
                  ),
                  showCursor: false,
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(descriptionSplashText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, height: 2)),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  height: double.infinity,
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      print("Next");
                      Get.off(const MainScreen(),
                          transition: Transition.leftToRight,
                          duration: const Duration(seconds: 2));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: blackGradientColor,
                          )),
                      child: Center(
                        child: Text(nextBtText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: colorTextBt,
                                decoration: TextDecoration.none,
                                fontSize: 16)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
