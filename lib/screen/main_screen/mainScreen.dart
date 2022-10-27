import 'package:acs_project_example/screen/main_screen/info_screen/infoScreen.dart';
import 'package:acs_project_example/screen/main_screen/job_screen/jobScreen.dart';
import 'package:acs_project_example/screen/main_screen/mess_screen/mess_screen.dart';
import 'package:acs_project_example/screen/main_screen/propose_screen/proposeScreen.dart';
import 'package:acs_project_example/state_manager/dataPostProvider.dart';
import 'package:acs_project_example/state_manager/providerController.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../../value/colors.dart';
import '../../widget/stateless/bottomNavigatorBar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> listPage = [
    const ProposeScreen(),
    const JobScreen(),
    const MessScreen(),
    const InfoScreen()
  ];
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProviderController, DataPostProvider>(
      builder: (context, value, value2, child) => Scaffold(
        body: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              listPage.elementAt(value.currentTab),
              Positioned(
                bottom: -15,
                child: BottomNavigatorBarCus(),
              ),
              value2.isLoadingData
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black12.withOpacity(0.6),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: backgroudWhiteItem,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
