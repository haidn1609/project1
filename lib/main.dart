import 'package:acs_project_example/screen/main_screen/main_screen.dart';
import 'package:acs_project_example/screen/splash_screen/first_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool checkFistInstall = false;
  final box = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (box.read("FistInstall") != null) {
      setState(() {
        checkFistInstall = box.read("FistInstall");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: checkFistInstall ? MainScreen() : FirstSplashScreen(),
    );
  }
}
