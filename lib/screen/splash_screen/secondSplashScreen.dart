import 'package:acs_project_example/screen/main_screen/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../value/colors.dart';
import '../../value/strings.dart';

class SecondSplashScreen extends StatelessWidget {
  SecondSplashScreen({Key? key}) : super(key: key);
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          width: widths,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/splash_screen_background.png"),
              fit: BoxFit.fill,
            ),
          ),
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
              Text(
                box.read("rule") == candidateBtText ? banner1Text : banner2Text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: bannerColorText,
                    decoration: TextDecoration.none,
                    fontSize: 20),
              ),
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
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  showCursor: false,
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(
                descriptionSplashText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, height: 2),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  height: double.infinity,
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Get.off(
                        const MainScreen(),
                        transition: Transition.leftToRight,
                        duration: const Duration(seconds: 2),
                      );
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
                        ),
                      ),
                      child: Center(
                        child: Text(
                          nextBtText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorTextWhite,
                              decoration: TextDecoration.none,
                              fontSize: 16),
                        ),
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
