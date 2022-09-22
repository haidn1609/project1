import 'package:acs_project_example/mock_data.dart';
import 'package:acs_project_example/state_manager/provider_controller.dart';
import 'package:acs_project_example/value/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemContendMess extends StatefulWidget {
  ItemContendMess({Key? key, required this.contend}) : super(key: key);
  Map<String, String> contend;

  @override
  State<ItemContendMess> createState() => _ItemContendMessState();
}

class _ItemContendMessState extends State<ItemContendMess> {
  late Map<String, String> contend;
  late DateTime timeSend;
  bool showTime = false;

  @override
  void initState() {
    super.initState();
    contend = widget.contend;
    var provider = Provider.of<ProviderController>(context, listen: false);
    timeSend = DateTime.parse(contend["timeSend"]!);
    showTime =
        DateTime.now().difference(timeSend).inDays > provider.differenceDay;
    if (showTime) {
      provider.setDifferenceDay(DateTime.now().difference(timeSend).inDays);
    }
  }

  Widget contendAvatar() {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(contend["avatar"].toString()))),
    );
  }

  Widget contendText(bool isSender) {
    return Flexible(
        child: Container(
      margin: isSender
          ? const EdgeInsets.only(left: 10)
          : const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10.0),
      decoration: isSender
          ? BoxDecoration(
              color: senderMessContendColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: const Offset(0, 3)),
              ],
            )
          : BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: const Offset(0, 3)),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: blackGradientColor)),
      child: Text(contend["contend"].toString(),
          style: TextStyle(color: isSender ? black : white)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderController>(
      builder: (context, value, child) => Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            showTime
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        "${timeSend.hour}:${timeSend.minute} ngày ${timeSend.day} thg ${timeSend.month} ${timeSend.year < DateTime.now().year ? "năm ${timeSend.year}" : ""}",
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  )
                : Container(),
            contend["sender"].toString().compareTo(userNow["name"]) == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      contendText(false),
                      contendAvatar(),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      contendAvatar(),
                      contendText(true),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
