import 'dart:async';

import 'package:acs_project_example/request_api/postRequestApi.dart';
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
  late DataPostProvider providerData;
  int countLoad = 0;

  @override
  void initState() {
    providerData = Provider.of<DataPostProvider>(context, listen: false);
    if (box.read("FistInstall") != null) {
      setState(() {
        checkFistInstall = box.read("FistInstall");
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      callData(context);
    });
    super.initState();
  }

  Future callData(BuildContext context) async {
    providerData.setLoading(true);
    providerData.clearPost();
    await Future.wait([
      providerData.loadCategory().then((value) => setState(() => countLoad++)),
      providerData.loadCareer().then((value) => setState(() => countLoad++)),
      providerData.loadCompany().then((value) => setState(() => countLoad++)),
      providerData.loadLocation().then((value) => setState(() => countLoad++)),
      providerData.loadSalary().then((value) => setState(() => countLoad++)),
      providerData
          .loadWorkingType()
          .then((value) => setState(() => countLoad++)),
    ]);
    providerData.setTotalPost(providerData.listCategory, "tin-tuyen-dung");
    for (int i = 1; i <= providerData.totalPage; i++) {
      await providerData.loadPost(
          subApiCategory,
          providerData.listCategory
              .where((element) => element.slug!.contains("tin-tuyen-dung"))
              .elementAt(0)
              .id,
          i);
    }
    setState(() => countLoad++);
    if (checkFistInstall && box.read("rule") != null) {
      await Future.delayed(const Duration(milliseconds: 500));
      providerData.setLoading(false);
      Get.to(const MainScreen(),
          transition: Transition.leftToRight,
          duration: const Duration(seconds: 1));
    } else {
      Get.to(FirstSplashScreen());
    }
  }

  @override
  void dispose() {
    providerData.dispose();
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
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(
                      color: colorTextBlack,
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  "Loading $countLoad/7",
                  style: TextStyle(
                    color: colorTextBlack,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  ),
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
