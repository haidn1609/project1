import 'dart:async';

import 'package:acs_project_example/state_manager/dataPostProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../../value/colors.dart';
import '../../value/strings.dart';
import '../main_screen/mainScreen.dart';
import 'firstSplashScreen.dart';

class LoadDataScreen extends StatefulWidget {
  const LoadDataScreen({Key? key}) : super(key: key);

  @override
  State<LoadDataScreen> createState() => _LoadDataScreenState();
}

class _LoadDataScreenState extends State<LoadDataScreen> {
  final box = GetStorage();
  bool checkFistInstall = false;
  var providerData;

  @override
  void initState() {
    providerData = Provider.of<DataPostProvider>(context, listen: false);
    if (box.read("FistInstall") != null) {
      setState(() {
        checkFistInstall = box.read("FistInstall");
      });
    }
    callData(context);
    super.initState();
  }

  Future callData(BuildContext context) async {
    providerData.setLoading(true);
    providerData.clearPost();
    await providerData.loadCategory();
    await providerData.loadCareer();
    await providerData.loadCompany();
    await providerData.loadLocation();
    await providerData.loadSalary();
    await providerData.loadWorkingType();
    await providerData.loadPost(1);
    providerData.setLoading(false);
    if (checkFistInstall && box.read("rule") != null) {
      Get.to(const MainScreen(),
          transition: Transition.leftToRight,
          duration: const Duration(seconds: 1));
    } else {
      Get.to(FirstSplashScreen());
    }
  }

  @override
  void dispose() {
    providerData!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    return Consumer<DataPostProvider>(
      builder: (context, value, child) => Container(
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
            value.isLoadingData
                ? CircularProgressIndicator(
                    color: colorTextBlack,
                  )
                : Container(),
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
