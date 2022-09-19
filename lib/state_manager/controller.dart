import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  final box = GetStorage();
  var rule = "no rule".obs;

  setRule(String _rule) {
    box.write("rule", _rule);
    rule = _rule.obs;
  }
}
