import 'package:acs_project_example/screen/main_screen/info_screen/info_screen.dart';
import 'package:acs_project_example/screen/main_screen/job_screen/job_screen.dart';
import 'package:acs_project_example/screen/main_screen/mess_screen/mess_screen.dart';
import 'package:acs_project_example/screen/main_screen/propose_screen/propose_screen.dart';
import 'package:acs_project_example/state_manager/provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../../widget/stateless/bottom_navigator_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderController>(
      builder: (context, value, child) => Scaffold(
          body: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            listPage.elementAt(value.currentTab),
            Positioned(
              bottom: -15,
              child: BottomNavigatorBarCus(),
            )
          ],
        ),
      )),
    );
  }
}
